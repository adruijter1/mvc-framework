<?php
/**
 * Deze controller regelt alle views in de map views/countries
 */


class Countries extends Controller 
{
    // Properties, fields
    private $countryModel;

    public function Arjan()
    {
        return "Arjan" . $this->index();
    }

    // Dit is de constructor
    public function __construct($test = NULL)
    {
        $this->countryModel = $this->model('Country');
    }

    public function index($title = NULL)
    {
        // Null coalescence operator
        // $message = $title ?? '<h3>Landenoverzicht</h3>';

        // Null coalescence assignment operator
        $title ??= '<h3>Landenoverzicht</h3>';

        /**
         * Haal via de method getCountries() uit de model Country de records op
         * uit de database
         */
        $countries = $this->countryModel->getCountries();

        /**
         * Maak de inhoud voor de tbody in de view
         */
        $rows = '';
        foreach ($countries as $value){
            $rows .= "<tr>
                        <td>" . $value->name . "</td>
                        <td>" . $value->capitalCity . "</td>
                        <td>" . $value->continent . "</td>
                        <td>" . number_format($value->population, 0, ',', '.') . "</td>
                        <td><a href='" . URLROOT . "/countries/update/$value->id'><i class='bi bi-pencil-square'></i></a></td>
                        <td><a href='" . URLROOT . "/countries/delete/$value->id'><i class='bi bi-x-square'></i></a></td>
                        </tr>";
        }

        /**
         * $data array bevat alle informatie voor de view contries/index
         */
        $data = [
        'title' => $title,
        'countries' => $rows
        ];
        $this->view('countries/index', $data);
    }

    public function update($id = null)
    {
        /**
         * Check of we van het update formulier komen
         */
        if ($_SERVER["REQUEST_METHOD"] == "POST") {

            /**
             * het $_POST array wordt schoongemaakt door de functie filter_input_array
             */
            $_POST = filter_input_array(INPUT_POST, FILTER_SANITIZE_FULL_SPECIAL_CHARS);

            /**
             * Maak het $data-array om de te wijzigen data in het formulier te zetten in de view
             */
            $data = [
                // 'title' => '<h3 style="color:green;">Update landenoverzicht succesvol</h3>',
                'id' => trim($_POST['id']),
                'name' => trim($_POST['name']),
                'capitalCity' => trim($_POST['capitalCity']),
                'continent' => trim($_POST['continent']),
                'population' => trim($_POST['population']),
                'nameError' => '',
                'capitalCityError' => '',
                'continentError' => '',
                'populationError' => ''
            ];

            /**
             * Valideer de ingevulde formulier waarden met de method
             */
            $data = $this->validateCreateForm($data);

            /**
             * Check of er geen validatie error is
             */
            if (
                empty($data['nameError']) &&
                empty($data['capitalCityError']) &&
                empty($data['continentError']) &&
                empty($data['populationError'])
            ) {
        
                /**
                 * Als er geen validatie-error is wordt de update uitgevoerd
                 */
                if ($this->countryModel->updateCountry($data)) {
                    /**
                     * Als de update ook daadwerkelijk is gelukt, 
                     * dan een melding dat de gegevens zijn gewijzigd
                     */
                    $data['title'] = '<h3 style="color:green;">Update landenoverzicht succesvol</h3>';
                   
                    /**
                     * Na drie seconden doorsturen naar de index pagina
                     */
                    header("Refresh:3; url=" . URLROOT . "/countries/index");
                } else {
                    /**
                     * Als de update niet is gelukt, de melding dat er een 
                     * interne server-error heeft plaatsgevonden
                     */
                    $data['title'] = '<h3>Update landenoverzicht</h3>';
                    echo "<div class='alert alert-danger' role='alert'>
                            Er heeft een interne servererror plaatsgevonden<br>probeer het later nog eens...
                        </div>";
                    header("Refresh:3; url=" . URLROOT . "/countries/index");
                }
            } else {
                $data['title'] = '<h3 style="color:green;">Data nog niet compleet ingevuld</h3>';
            }
            /**
             * Stuur het $data array met de validatie error meldingen naar de pagina update
             */
            $this->view("countries/update", $data);
        } else {
            /**
             * Wanneer we van de countries/index.php pagina afkomen dan sturen we het opgehaalde 
             * record naar de countries/update.php pagina d.m.v. het $data array.
             */
            $row = $this->countryModel->getSingleCountry($id);
            $data = [
                'title' => '<h3>Update landenoverzicht</h3>',
                'id' => $row->id,
                'name' => $row->name,
                'capitalCity' => $row->capitalCity,
                'continent' => $row->continent,
                'population' => $row->population,
                'nameError' => '',
                'capitalCityError' => '',
                'continentError' => '',
                'populationError' => ''
            ];
            
            $this->view("countries/update", $data);
        }    
    }

    // public function delete($id) 
    // {
    //     if ($this->countryModel->deleteCountry($id)) {
    //         $data = [
    //             'deleteStatus' =>  "<div class='alert alert-danger' role='alert'>
    //                                     Het record is verwijdert
    //                                 </div>"
    //         ];
    //     } else {
    //         $data =[
    //             'deleteStatus' =>  "<div class='alert alert-danger' role='alert'>
    //                                     Interne servererror het record is niet verwijdert
    //                                 </div>"
    //         ];
    //     }
    //     $this->view("countries/delete", $data);
    //     header("Refresh:3; url=" . URLROOT . "/countries/index");
    // }

    public function delete($id) 
    {
        header("Refresh:3; url=" . URLROOT . "/countries/index");
        if ($this->countryModel->deleteCountry($id)) {
            $message = "<h3 style='color:green;'>Delete is succesvol</h3>";
        } else {
            $message = "<h3 style='color:red;'>Delete is not succesvol</h3>";
        }
        $this->index($message);
        
    }

    public function create() 
    {
        /**
         * Default waarden voor de view create.php
         */
        $data = [
        'title' => '<h3>Voeg een nieuw land in</h3>',
        'name' => '',
        'capitalCity' => '',
        'continent' => '',
        'population' => '',
        'nameError' => '',
        'capitalCityError' => '',
        'continentError' => '',
        'populationError' => ''
        ];

        if ($_SERVER["REQUEST_METHOD"] == "POST") {

            $_POST = filter_input_array(INPUT_POST, FILTER_SANITIZE_FULL_SPECIAL_CHARS);

            $data = [
            'title' => '<h3>Voeg een nieuw land in</h3>',
            'name' => trim($_POST['name']),
            'capitalCity' => trim($_POST['capitalCity']),
            'continent' => trim($_POST['continent']),
            'population' => trim($_POST['population']),
            'nameError' => '',
            'capitalCityError' => '',
            'continentError' => '',
            'populationError' => ''
            ];

            $data = $this->validateCreateForm($data);
        
            if (empty($data['nameError']) && empty($data['capitalCityError']) && empty($data['continentError']) && empty($data['populationError'])) {
                if ($this->countryModel->createCountry($_POST)) {
                    echo "<div class='alert alert-danger' role='alert'>
                            Uw gegevens zijn opgeslagen...
                        </div>";
                    header("Refresh:3; url=" . URLROOT . "/countries/index");
                } else {
                    echo "<div class='alert alert-danger' role='alert'>
                            Er heeft een interne servererror plaatsgevonden<br>probeer het later nog eens...
                        </div>";
                    header("Refresh:3; url=" . URLROOT . "/countries/index");
                }
            }
        } 

        $this->view("countries/create", $data);    
    }

    private function validateCreateForm($data) 
    {
        if (empty($data['name'])) {

            $data['nameError'] = 'U heeft nog geen land ingevuld';
        } elseif (filter_var($data['name'], FILTER_VALIDATE_EMAIL)) {
        $data['nameError'] = 'U heeft blijkbaar geen emailadres ingevuld';
        } elseif(!preg_match('/^[a-zA-Z]*/', $data['name'])) {
        $data['nameError'] = 'U heeft andere tekens gebruikt dan die in het alfabet';
        }

        if (empty($data['capitalCity'])) {
        $data['capitalCityError'] = 'U heeft nog geen hoofdstad van het land ingevuld';
        }

        if (empty($data['continent'])) {
        $data['continentError'] = 'U heeft nog geen continent ingevuld';
        } elseif (!in_array($data['continent'], ['Afrika','Antartica','Azie','Australie/Oceanie','Europa','Noord-Amerika','Zuid-Amerika'])) {
        $data['continentError'] = 'U heeft een niet bestaand continent opgegeven, probeer het opnieuw';
        }

        if (empty($data['population'])) {
        $data['populationError'] = 'U heeft nog niet het inwonersaantal van het land ingevuld';
        } elseif($data['population'] > 4294967295) {
        $data['populationError'] = 'U heeft een te groot inwonersaantal ingevuld';
        }
        return $data;
    }

    public function scanCountry() 
    {
        if ($_SERVER["REQUEST_METHOD"] == "POST") {
        $_POST = filter_input_array(INPUT_POST, FILTER_SANITIZE_FULL_SPECIAL_CHARS);

        $record = $this->countryModel->getSingleCountryByName($_POST["country"]);

        $rowData = "<tr>
                    <td>$record->id</td>
                    <td>$record->name</td>
                    <td>$record->capitalCity</td>
                    <td>$record->continent</td>
                    <td>$record->population</td>
                    </tr>";

        $data = [
        'title' => 'Dit is het gescande land',
        'rowData' => $rowData
        ];

        $this->view('countries/scanCountry', $data);
        } else {
            $data = [
            'title' => 'Scan het land',
            'rowData' => ""
            ];

            $this->view('countries/scanCountry', $data);
        }
    }

    public function sayMyName($name)
    {
        return "Hallo mijn naam is: " . $name;
    }
}

