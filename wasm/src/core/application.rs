use antiq::{
    Application,
    ui::{Color, Ui3d},
};

pub struct Normalizer {}

impl Normalizer {
    fn new() -> Self {
        Self {}
    }
}

impl Application for Normalizer {
    fn build_ui(&self) -> Ui3d {
        let mut ui = Ui3d::new();
        ui.set_background_color(&Color::new(0.25, 0.23, 0.23));
        ui
    }
}

impl Default for Normalizer {
    fn default() -> Self {
        Self::new()
    }
}
