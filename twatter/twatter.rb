require 'tk'

root = TkRoot.new {
  title "X-Twat"
}

frame = Tk::Tile::Frame.new(root) do
  relief 'solid'
  borderwidth 5
end
frame.grid(sticky: 'nsew')

image1 = TkPhotoImage.new(file: "twatter.png")
image2 = TkPhotoImage.new(file: "goat_piss.png")

label = TkLabel.new(frame)
label.image = image1
label.grid(sticky: 'nsew')

button = TkButton.new(frame) {
  text "Swap Image"
}
button.grid(sticky: 'nsew')

button.command do
  if label.cget('image') == image1
    label.image = image2
  else
    label.image = image1
  end
end

Tk.mainloop