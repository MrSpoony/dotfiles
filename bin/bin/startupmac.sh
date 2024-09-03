#!/bin/bash
hidutil property --set '{"UserKeyMapping":[{"HIDKeyboardModifierMappingSrc":0x700000039,"HIDKeyboardModifierMappingDst":0x70000002A},{"HIDKeyboardModifierMappingSrc":0x700000035,"HIDKeyboardModifierMappingDst":0x700000064},{"HIDKeyboardModifierMappingSrc":0x700000064,"HIDKeyboardModifierMappingDst":0x700000035},{"HIDKeyboardModifierMappingSrc":0x700000032,"HIDKeyboardModifierMappingDst":0x700000036}]}'
defaults write -g ApplePressAndHoldEnabled 1
# sudo -u u80860794 gitlab-runner stop
