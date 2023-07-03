const characters = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'

export function GenerateCodeSet(classSelected, existingCodes, length, amount) {
    let codesGenerated = [];

    for (let i = 0; i < amount; i++) {
        codesGenerated.push(CodeString(length, classSelected, codesGenerated, existingCodes))
    }
    return codesGenerated;
}

function CodeString(length, classSelected, Codes, existingCodes) {
    let Code = classSelected;
    for (let i = 0; i < length; i++) {
        Code += characters.charAt(Math.floor(Math.random() * characters.length));
    }
    return ValidateCodeArray(Code, Codes, existingCodes, length, classSelected);
}

function ValidateCodeArray(Code, Codes, existingCodes, length, classSelected) {
    if (Codes == null) return Code;
    for (let i = 0; i < Codes.length; i++) {
        if (Code === Codes[i]) return CodeString(length, classSelected, Codes);
        for (let i = 0; i < existingCodes; i++) if (Code === existingCodes[i]) return CodeString(length, classSelected, Codes);
    }
    return Code;
}