require 'tk'

# Store the currently open dialog
$current_dialog = nil

def create_dialog(title)
  # Close the current dialog if there is one
  if $current_dialog
    $current_dialog.destroy
    $current_dialog = nil
  end

  dialog = TkToplevel.new do
    title title
    geometry "+#{(TkWinfo.screenwidth(root) - 300) / 2}+#{(TkWinfo.screenheight(root) - 200) / 2}"
  end

  TkLabel.new(dialog, text: 'Username:').grid(row: 0, column: 0, padx: 10, pady: 10)
  TkEntry.new(dialog).grid(row: 0, column: 1, padx: 10, pady: 10)
  TkLabel.new(dialog, text: 'Password:').grid(row: 1, column: 0, padx: 10, pady: 10)
  TkEntry.new(dialog, show: '*').grid(row: 1, column: 1, padx: 10, pady: 10)
  TkButton.new(dialog, text: 'Enter').grid(row: 2, column: 0, columnspan: 2, padx: 10, pady: 10)

  # Store the current dialog
  $current_dialog = dialog

  dialog
end

root = TkRoot.new do
  title "Todo List App"
  geometry "800x600+#{(TkWinfo.screenwidth(self) - 800) / 2}+#{(TkWinfo.screenheight(self) - 600) / 2}"
end

root.minsize(300, 200)

# Create a 3x3 grid
count = 1
3.times do |i|
  3.times do |j|
    # Create a frame for each cell with a dark border
    frame = TkFrame.new(root, borderwidth: 2, relief: 'groove').grid(row: i, column: j, sticky: 'nsew')
    root.grid_columnconfigure(i, weight: 1)
    root.grid_rowconfigure(j, weight: 1)

    if count == 5 # Middle box
      TkLabel.new(frame, text: "Welcome to the Todo list manager.").grid(row: 0, column: 0, padx: 10, pady: 10, sticky: 'nsew')

      button_frame = TkFrame.new(frame).grid(row: 1, column: 0, padx: 10, pady: 10, sticky: 'nsew')
      TkButton.new(button_frame, text: 'Login', command: proc { create_dialog('Login') }).grid(row: 0, column: 0, padx: 5)
      TkButton.new(button_frame, text: 'Signup', command: proc { create_dialog('Signup') }).grid(row: 0, column: 1, padx: 5)
    else
      # Add a number to each cell
      TkLabel.new(frame, text: count.to_s).grid(row: 0, column: 0, padx: 10, pady: 10)
    end

    count += 1
  end
end

Tk.mainloop
