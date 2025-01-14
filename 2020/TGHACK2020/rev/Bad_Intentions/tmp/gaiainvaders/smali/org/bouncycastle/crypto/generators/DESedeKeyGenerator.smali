.class public Lorg/bouncycastle/crypto/generators/DESedeKeyGenerator;
.super Lorg/bouncycastle/crypto/generators/DESKeyGenerator;


# static fields
.field private static final MAX_IT:I = 0x14


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Lorg/bouncycastle/crypto/generators/DESKeyGenerator;-><init>()V

    return-void
.end method


# virtual methods
.method public generateKey()[B
    .locals 4

    iget v0, p0, Lorg/bouncycastle/crypto/generators/DESedeKeyGenerator;->strength:I

    new-array v0, v0, [B

    const/4 v1, 0x0

    const/4 v2, 0x0

    :cond_0
    iget-object v3, p0, Lorg/bouncycastle/crypto/generators/DESedeKeyGenerator;->random:Ljava/security/SecureRandom;

    invoke-virtual {v3, v0}, Ljava/security/SecureRandom;->nextBytes([B)V

    invoke-static {v0}, Lorg/bouncycastle/crypto/params/DESedeParameters;->setOddParity([B)V

    add-int/lit8 v2, v2, 0x1

    const/16 v3, 0x14

    if-ge v2, v3, :cond_1

    array-length v3, v0

    invoke-static {v0, v1, v3}, Lorg/bouncycastle/crypto/params/DESedeParameters;->isWeakKey([BII)Z

    move-result v3

    if-nez v3, :cond_0

    invoke-static {v0, v1}, Lorg/bouncycastle/crypto/params/DESedeParameters;->isRealEDEKey([BI)Z

    move-result v3

    if-eqz v3, :cond_0

    :cond_1
    array-length v2, v0

    invoke-static {v0, v1, v2}, Lorg/bouncycastle/crypto/params/DESedeParameters;->isWeakKey([BII)Z

    move-result v2

    if-nez v2, :cond_2

    invoke-static {v0, v1}, Lorg/bouncycastle/crypto/params/DESedeParameters;->isRealEDEKey([BI)Z

    move-result v1

    if-eqz v1, :cond_2

    return-object v0

    :cond_2
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Unable to generate DES-EDE key"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    goto :goto_1

    :goto_0
    throw v0

    :goto_1
    goto :goto_0
.end method

.method public init(Lorg/bouncycastle/crypto/KeyGenerationParameters;)V
    .locals 3

    invoke-virtual {p1}, Lorg/bouncycastle/crypto/KeyGenerationParameters;->getRandom()Ljava/security/SecureRandom;

    move-result-object v0

    iput-object v0, p0, Lorg/bouncycastle/crypto/generators/DESedeKeyGenerator;->random:Ljava/security/SecureRandom;

    invoke-virtual {p1}, Lorg/bouncycastle/crypto/KeyGenerationParameters;->getStrength()I

    move-result p1

    add-int/lit8 p1, p1, 0x7

    div-int/lit8 p1, p1, 0x8

    iput p1, p0, Lorg/bouncycastle/crypto/generators/DESedeKeyGenerator;->strength:I

    iget p1, p0, Lorg/bouncycastle/crypto/generators/DESedeKeyGenerator;->strength:I

    const/16 v0, 0x18

    if-eqz p1, :cond_3

    iget p1, p0, Lorg/bouncycastle/crypto/generators/DESedeKeyGenerator;->strength:I

    const/16 v1, 0x15

    if-ne p1, v1, :cond_0

    goto :goto_0

    :cond_0
    iget p1, p0, Lorg/bouncycastle/crypto/generators/DESedeKeyGenerator;->strength:I

    const/16 v1, 0xe

    const/16 v2, 0x10

    if-ne p1, v1, :cond_1

    iput v2, p0, Lorg/bouncycastle/crypto/generators/DESedeKeyGenerator;->strength:I

    goto :goto_1

    :cond_1
    iget p1, p0, Lorg/bouncycastle/crypto/generators/DESedeKeyGenerator;->strength:I

    if-eq p1, v0, :cond_4

    iget p1, p0, Lorg/bouncycastle/crypto/generators/DESedeKeyGenerator;->strength:I

    if-ne p1, v2, :cond_2

    goto :goto_1

    :cond_2
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "DESede key must be 192 or 128 bits long."

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    :cond_3
    :goto_0
    iput v0, p0, Lorg/bouncycastle/crypto/generators/DESedeKeyGenerator;->strength:I

    :cond_4
    :goto_1
    return-void
.end method
