.class public Lorg/bouncycastle/jcajce/provider/asymmetric/ec/GMSignatureSpi$sm3WithSM2;
.super Lorg/bouncycastle/jcajce/provider/asymmetric/ec/GMSignatureSpi;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/bouncycastle/jcajce/provider/asymmetric/ec/GMSignatureSpi;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "sm3WithSM2"
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 4

    new-instance v0, Lorg/bouncycastle/crypto/digests/SM3Digest;

    invoke-direct {v0}, Lorg/bouncycastle/crypto/digests/SM3Digest;-><init>()V

    new-instance v1, Lorg/bouncycastle/crypto/signers/SM2Signer;

    invoke-direct {v1}, Lorg/bouncycastle/crypto/signers/SM2Signer;-><init>()V

    new-instance v2, Lorg/bouncycastle/jcajce/provider/asymmetric/ec/GMSignatureSpi$StdDSAEncoder;

    const/4 v3, 0x0

    invoke-direct {v2, v3}, Lorg/bouncycastle/jcajce/provider/asymmetric/ec/GMSignatureSpi$StdDSAEncoder;-><init>(Lorg/bouncycastle/jcajce/provider/asymmetric/ec/GMSignatureSpi$1;)V

    invoke-direct {p0, v0, v1, v2}, Lorg/bouncycastle/jcajce/provider/asymmetric/ec/GMSignatureSpi;-><init>(Lorg/bouncycastle/crypto/Digest;Lorg/bouncycastle/crypto/DSA;Lorg/bouncycastle/jcajce/provider/asymmetric/util/DSAEncoder;)V

    return-void
.end method
