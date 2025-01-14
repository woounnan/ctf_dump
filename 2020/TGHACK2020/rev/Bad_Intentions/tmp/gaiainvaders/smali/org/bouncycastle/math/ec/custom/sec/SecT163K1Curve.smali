.class public Lorg/bouncycastle/math/ec/custom/sec/SecT163K1Curve;
.super Lorg/bouncycastle/math/ec/ECCurve$AbstractF2m;


# static fields
.field private static final SecT163K1_DEFAULT_COORDS:I = 0x6


# instance fields
.field protected infinity:Lorg/bouncycastle/math/ec/custom/sec/SecT163K1Point;


# direct methods
.method public constructor <init>()V
    .locals 4

    const/4 v0, 0x6

    const/16 v1, 0xa3

    const/4 v2, 0x3

    const/4 v3, 0x7

    invoke-direct {p0, v1, v2, v0, v3}, Lorg/bouncycastle/math/ec/ECCurve$AbstractF2m;-><init>(IIII)V

    new-instance v1, Lorg/bouncycastle/math/ec/custom/sec/SecT163K1Point;

    const/4 v2, 0x0

    invoke-direct {v1, p0, v2, v2}, Lorg/bouncycastle/math/ec/custom/sec/SecT163K1Point;-><init>(Lorg/bouncycastle/math/ec/ECCurve;Lorg/bouncycastle/math/ec/ECFieldElement;Lorg/bouncycastle/math/ec/ECFieldElement;)V

    iput-object v1, p0, Lorg/bouncycastle/math/ec/custom/sec/SecT163K1Curve;->infinity:Lorg/bouncycastle/math/ec/custom/sec/SecT163K1Point;

    const-wide/16 v1, 0x1

    invoke-static {v1, v2}, Ljava/math/BigInteger;->valueOf(J)Ljava/math/BigInteger;

    move-result-object v1

    invoke-virtual {p0, v1}, Lorg/bouncycastle/math/ec/custom/sec/SecT163K1Curve;->fromBigInteger(Ljava/math/BigInteger;)Lorg/bouncycastle/math/ec/ECFieldElement;

    move-result-object v1

    iput-object v1, p0, Lorg/bouncycastle/math/ec/custom/sec/SecT163K1Curve;->a:Lorg/bouncycastle/math/ec/ECFieldElement;

    iget-object v1, p0, Lorg/bouncycastle/math/ec/custom/sec/SecT163K1Curve;->a:Lorg/bouncycastle/math/ec/ECFieldElement;

    iput-object v1, p0, Lorg/bouncycastle/math/ec/custom/sec/SecT163K1Curve;->b:Lorg/bouncycastle/math/ec/ECFieldElement;

    new-instance v1, Ljava/math/BigInteger;

    const-string v2, "04000000000000000000020108A2E0CC0D99F8A5EF"

    invoke-static {v2}, Lorg/bouncycastle/util/encoders/Hex;->decode(Ljava/lang/String;)[B

    move-result-object v2

    const/4 v3, 0x1

    invoke-direct {v1, v3, v2}, Ljava/math/BigInteger;-><init>(I[B)V

    iput-object v1, p0, Lorg/bouncycastle/math/ec/custom/sec/SecT163K1Curve;->order:Ljava/math/BigInteger;

    const-wide/16 v1, 0x2

    invoke-static {v1, v2}, Ljava/math/BigInteger;->valueOf(J)Ljava/math/BigInteger;

    move-result-object v1

    iput-object v1, p0, Lorg/bouncycastle/math/ec/custom/sec/SecT163K1Curve;->cofactor:Ljava/math/BigInteger;

    iput v0, p0, Lorg/bouncycastle/math/ec/custom/sec/SecT163K1Curve;->coord:I

    return-void
.end method


# virtual methods
.method protected cloneCurve()Lorg/bouncycastle/math/ec/ECCurve;
    .locals 1

    new-instance v0, Lorg/bouncycastle/math/ec/custom/sec/SecT163K1Curve;

    invoke-direct {v0}, Lorg/bouncycastle/math/ec/custom/sec/SecT163K1Curve;-><init>()V

    return-object v0
.end method

.method protected createDefaultMultiplier()Lorg/bouncycastle/math/ec/ECMultiplier;
    .locals 1

    new-instance v0, Lorg/bouncycastle/math/ec/WTauNafMultiplier;

    invoke-direct {v0}, Lorg/bouncycastle/math/ec/WTauNafMultiplier;-><init>()V

    return-object v0
.end method

.method protected createRawPoint(Lorg/bouncycastle/math/ec/ECFieldElement;Lorg/bouncycastle/math/ec/ECFieldElement;Z)Lorg/bouncycastle/math/ec/ECPoint;
    .locals 1

    new-instance v0, Lorg/bouncycastle/math/ec/custom/sec/SecT163K1Point;

    invoke-direct {v0, p0, p1, p2, p3}, Lorg/bouncycastle/math/ec/custom/sec/SecT163K1Point;-><init>(Lorg/bouncycastle/math/ec/ECCurve;Lorg/bouncycastle/math/ec/ECFieldElement;Lorg/bouncycastle/math/ec/ECFieldElement;Z)V

    return-object v0
.end method

.method protected createRawPoint(Lorg/bouncycastle/math/ec/ECFieldElement;Lorg/bouncycastle/math/ec/ECFieldElement;[Lorg/bouncycastle/math/ec/ECFieldElement;Z)Lorg/bouncycastle/math/ec/ECPoint;
    .locals 7

    new-instance v6, Lorg/bouncycastle/math/ec/custom/sec/SecT163K1Point;

    move-object v0, v6

    move-object v1, p0

    move-object v2, p1

    move-object v3, p2

    move-object v4, p3

    move v5, p4

    invoke-direct/range {v0 .. v5}, Lorg/bouncycastle/math/ec/custom/sec/SecT163K1Point;-><init>(Lorg/bouncycastle/math/ec/ECCurve;Lorg/bouncycastle/math/ec/ECFieldElement;Lorg/bouncycastle/math/ec/ECFieldElement;[Lorg/bouncycastle/math/ec/ECFieldElement;Z)V

    return-object v6
.end method

.method public fromBigInteger(Ljava/math/BigInteger;)Lorg/bouncycastle/math/ec/ECFieldElement;
    .locals 1

    new-instance v0, Lorg/bouncycastle/math/ec/custom/sec/SecT163FieldElement;

    invoke-direct {v0, p1}, Lorg/bouncycastle/math/ec/custom/sec/SecT163FieldElement;-><init>(Ljava/math/BigInteger;)V

    return-object v0
.end method

.method public getFieldSize()I
    .locals 1

    const/16 v0, 0xa3

    return v0
.end method

.method public getInfinity()Lorg/bouncycastle/math/ec/ECPoint;
    .locals 1

    iget-object v0, p0, Lorg/bouncycastle/math/ec/custom/sec/SecT163K1Curve;->infinity:Lorg/bouncycastle/math/ec/custom/sec/SecT163K1Point;

    return-object v0
.end method

.method public getK1()I
    .locals 1

    const/4 v0, 0x3

    return v0
.end method

.method public getK2()I
    .locals 1

    const/4 v0, 0x6

    return v0
.end method

.method public getK3()I
    .locals 1

    const/4 v0, 0x7

    return v0
.end method

.method public getM()I
    .locals 1

    const/16 v0, 0xa3

    return v0
.end method

.method public isKoblitz()Z
    .locals 1

    const/4 v0, 0x1

    return v0
.end method

.method public isTrinomial()Z
    .locals 1

    const/4 v0, 0x0

    return v0
.end method

.method public supportsCoordinateSystem(I)Z
    .locals 1

    const/4 v0, 0x6

    if-eq p1, v0, :cond_0

    const/4 p1, 0x0

    return p1

    :cond_0
    const/4 p1, 0x1

    return p1
.end method
