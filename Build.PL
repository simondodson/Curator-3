
use Module::Build;
my $mb = Module::Build->new(
    license => 'perl',
    requires => {
        'IO::CaptureOutput' => 1.1102,
        'Image::Magick' => 6.77,
        'XML::LibXML' => 2.0004,
        'File::Copy::Recursive' => 0.38,
        'Imager' => 0.94,
        'Data::UUID' => 1.218,
        'YAML' => 0.84,
        'Archive::Zip' => 1.30,
    },
);
$mb->create_build_script;
