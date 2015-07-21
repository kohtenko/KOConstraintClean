# KOConstraintClean

Simple gem to cleanup all your storyboard and xib files from useless constraints.
Are you tired from uncountable constraints you don't need anymore? Xcode's interface builder thinks it's smart enough and keep all constraints you remove in case you want use them with `Size Classes`, but in most cases you just don't want it anymore!

If this what you see pretty often in your projects:

![Output sample](https://raw.github.com/kohtenko/KOConstraintClean/master/before.png)

then you definitely want to use `KOConstraintClean` to get this result in one click:

![Output sample](https://raw.github.com/kohtenko/KOConstraintClean/master/after.png)

If you use some constraint for `Size Classes` it will not be removed! Constraints removed only if they are really useless.

## Installation
Just execute install command in terminal
  
`$ gem install constraintClean`

## Usage
In your terminal navigate to your project directory:

`$ cd YourProjectDirectory`

And run 

`$ constraintClean`

This is it! Now all your `storyboard` and `xib` files are pretty again!

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/kohtenko/KOConstraintClean.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

