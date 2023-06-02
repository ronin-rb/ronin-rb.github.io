## Troubleshooting

Ruby and many ruby gems will **not** work if the `LANG` environment variable is
not set or set to `C`. Make sure that `LANG` is set to a UTF8 language, such as
`en_US.UTF-8`.
