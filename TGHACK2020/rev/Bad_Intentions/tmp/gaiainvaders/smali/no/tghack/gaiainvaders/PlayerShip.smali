.class public final Lno/tghack/gaiainvaders/PlayerShip;
.super Ljava/lang/Object;
.source "PlayerShip.kt"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lno/tghack/gaiainvaders/PlayerShip$Companion;
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    bv = {
        0x1,
        0x0,
        0x3
    }
    d1 = {
        "\u0000>\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0008\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0005\n\u0002\u0010\u0007\n\u0002\u0008\u0006\n\u0002\u0018\u0002\n\u0002\u0008\u0007\n\u0002\u0010\u0002\n\u0000\n\u0002\u0010\t\n\u0002\u0008\u0002\u0018\u0000 !2\u00020\u0001:\u0001!B\u001d\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0005\u0012\u0006\u0010\u0006\u001a\u00020\u0005\u00a2\u0006\u0002\u0010\u0007J\u000e\u0010\u001d\u001a\u00020\u001e2\u0006\u0010\u001f\u001a\u00020 R\u001a\u0010\u0008\u001a\u00020\tX\u0086\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\u0008\n\u0010\u000b\"\u0004\u0008\u000c\u0010\rR\u000e\u0010\u000e\u001a\u00020\u000fX\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u001a\u0010\u0010\u001a\u00020\u0005X\u0086\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\u0008\u0011\u0010\u0012\"\u0004\u0008\u0013\u0010\u0014R\u0011\u0010\u0015\u001a\u00020\u0016\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0017\u0010\u0018R\u000e\u0010\u0004\u001a\u00020\u0005X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0019\u001a\u00020\u000fX\u0082D\u00a2\u0006\u0002\n\u0000R\u0011\u0010\u001a\u001a\u00020\u000f\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u001b\u0010\u001c\u00a8\u0006\""
    }
    d2 = {
        "Lno/tghack/gaiainvaders/PlayerShip;",
        "",
        "context",
        "Landroid/content/Context;",
        "screenX",
        "",
        "screenY",
        "(Landroid/content/Context;II)V",
        "bitmap",
        "Landroid/graphics/Bitmap;",
        "getBitmap",
        "()Landroid/graphics/Bitmap;",
        "setBitmap",
        "(Landroid/graphics/Bitmap;)V",
        "height",
        "",
        "moving",
        "getMoving",
        "()I",
        "setMoving",
        "(I)V",
        "position",
        "Landroid/graphics/RectF;",
        "getPosition",
        "()Landroid/graphics/RectF;",
        "speed",
        "width",
        "getWidth",
        "()F",
        "update",
        "",
        "fps",
        "",
        "Companion",
        "app_release"
    }
    k = 0x1
    mv = {
        0x1,
        0x1,
        0x10
    }
.end annotation


# static fields
.field public static final Companion:Lno/tghack/gaiainvaders/PlayerShip$Companion;

.field public static final left:I = 0x1

.field public static final right:I = 0x2

.field public static final stopped:I


# instance fields
.field private bitmap:Landroid/graphics/Bitmap;

.field private final height:F

.field private moving:I

.field private final position:Landroid/graphics/RectF;

.field private final screenX:I

.field private final speed:F

.field private final width:F


# direct methods
.method static constructor <clinit>()V
    .locals 2

    new-instance v0, Lno/tghack/gaiainvaders/PlayerShip$Companion;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lno/tghack/gaiainvaders/PlayerShip$Companion;-><init>(Lkotlin/jvm/internal/DefaultConstructorMarker;)V

    sput-object v0, Lno/tghack/gaiainvaders/PlayerShip;->Companion:Lno/tghack/gaiainvaders/PlayerShip$Companion;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;II)V
    .locals 3

    const-string v0, "context"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkParameterIsNotNull(Ljava/lang/Object;Ljava/lang/String;)V

    .line 8
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p2, p0, Lno/tghack/gaiainvaders/PlayerShip;->screenX:I

    .line 14
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    const p2, 0x7f070066

    .line 13
    invoke-static {p1, p2}, Landroid/graphics/BitmapFactory;->decodeResource(Landroid/content/res/Resources;I)Landroid/graphics/Bitmap;

    move-result-object p1

    const-string p2, "BitmapFactory.decodeReso\u2026drawable.playership\n    )"

    invoke-static {p1, p2}, Lkotlin/jvm/internal/Intrinsics;->checkExpressionValueIsNotNull(Ljava/lang/Object;Ljava/lang/String;)V

    iput-object p1, p0, Lno/tghack/gaiainvaders/PlayerShip;->bitmap:Landroid/graphics/Bitmap;

    .line 19
    iget p1, p0, Lno/tghack/gaiainvaders/PlayerShip;->screenX:I

    int-to-float p2, p1

    const/high16 v0, 0x41a00000    # 20.0f

    div-float/2addr p2, v0

    iput p2, p0, Lno/tghack/gaiainvaders/PlayerShip;->width:F

    int-to-float p2, p3

    const/high16 p3, 0x41f00000    # 30.0f

    div-float p3, p2, p3

    .line 20
    iput p3, p0, Lno/tghack/gaiainvaders/PlayerShip;->height:F

    .line 23
    new-instance p3, Landroid/graphics/RectF;

    int-to-float v0, p1

    const/high16 v1, 0x40000000    # 2.0f

    div-float/2addr v0, v1

    .line 25
    iget v1, p0, Lno/tghack/gaiainvaders/PlayerShip;->height:F

    sub-float v1, p2, v1

    const/16 v2, 0xf0

    int-to-float v2, v2

    sub-float/2addr v1, v2

    .line 26
    div-int/lit8 p1, p1, 0x2

    int-to-float p1, p1

    iget v2, p0, Lno/tghack/gaiainvaders/PlayerShip;->width:F

    add-float/2addr p1, v2

    .line 23
    invoke-direct {p3, v0, v1, p1, p2}, Landroid/graphics/RectF;-><init>(FFFF)V

    iput-object p3, p0, Lno/tghack/gaiainvaders/PlayerShip;->position:Landroid/graphics/RectF;

    const/high16 p1, 0x43e10000    # 450.0f

    .line 30
    iput p1, p0, Lno/tghack/gaiainvaders/PlayerShip;->speed:F

    .line 47
    iget-object p1, p0, Lno/tghack/gaiainvaders/PlayerShip;->bitmap:Landroid/graphics/Bitmap;

    .line 48
    iget p2, p0, Lno/tghack/gaiainvaders/PlayerShip;->width:F

    float-to-int p2, p2

    .line 49
    iget p3, p0, Lno/tghack/gaiainvaders/PlayerShip;->height:F

    float-to-int p3, p3

    const/4 v0, 0x0

    .line 47
    invoke-static {p1, p2, p3, v0}, Landroid/graphics/Bitmap;->createScaledBitmap(Landroid/graphics/Bitmap;IIZ)Landroid/graphics/Bitmap;

    move-result-object p1

    const-string p2, "Bitmap.createScaledBitma\u2026nt() ,\n            false)"

    invoke-static {p1, p2}, Lkotlin/jvm/internal/Intrinsics;->checkExpressionValueIsNotNull(Ljava/lang/Object;Ljava/lang/String;)V

    iput-object p1, p0, Lno/tghack/gaiainvaders/PlayerShip;->bitmap:Landroid/graphics/Bitmap;

    return-void
.end method


# virtual methods
.method public final getBitmap()Landroid/graphics/Bitmap;
    .locals 1

    .line 13
    iget-object v0, p0, Lno/tghack/gaiainvaders/PlayerShip;->bitmap:Landroid/graphics/Bitmap;

    return-object v0
.end method

.method public final getMoving()I
    .locals 1

    .line 42
    iget v0, p0, Lno/tghack/gaiainvaders/PlayerShip;->moving:I

    return v0
.end method

.method public final getPosition()Landroid/graphics/RectF;
    .locals 1

    .line 23
    iget-object v0, p0, Lno/tghack/gaiainvaders/PlayerShip;->position:Landroid/graphics/RectF;

    return-object v0
.end method

.method public final getWidth()F
    .locals 1

    .line 19
    iget v0, p0, Lno/tghack/gaiainvaders/PlayerShip;->width:F

    return v0
.end method

.method public final setBitmap(Landroid/graphics/Bitmap;)V
    .locals 1

    const-string v0, "<set-?>"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkParameterIsNotNull(Ljava/lang/Object;Ljava/lang/String;)V

    .line 13
    iput-object p1, p0, Lno/tghack/gaiainvaders/PlayerShip;->bitmap:Landroid/graphics/Bitmap;

    return-void
.end method

.method public final setMoving(I)V
    .locals 0

    .line 42
    iput p1, p0, Lno/tghack/gaiainvaders/PlayerShip;->moving:I

    return-void
.end method

.method public final update(J)V
    .locals 3

    .line 58
    iget v0, p0, Lno/tghack/gaiainvaders/PlayerShip;->moving:I

    const/4 v1, 0x1

    if-ne v0, v1, :cond_0

    iget-object v0, p0, Lno/tghack/gaiainvaders/PlayerShip;->position:Landroid/graphics/RectF;

    iget v0, v0, Landroid/graphics/RectF;->left:F

    const/4 v1, 0x0

    int-to-float v1, v1

    cmpl-float v0, v0, v1

    if-lez v0, :cond_0

    .line 59
    iget-object v0, p0, Lno/tghack/gaiainvaders/PlayerShip;->position:Landroid/graphics/RectF;

    iget v1, v0, Landroid/graphics/RectF;->left:F

    iget v2, p0, Lno/tghack/gaiainvaders/PlayerShip;->speed:F

    long-to-float p1, p1

    div-float/2addr v2, p1

    sub-float/2addr v1, v2

    iput v1, v0, Landroid/graphics/RectF;->left:F

    goto :goto_0

    .line 62
    :cond_0
    iget v0, p0, Lno/tghack/gaiainvaders/PlayerShip;->moving:I

    const/4 v1, 0x2

    if-ne v0, v1, :cond_1

    iget-object v0, p0, Lno/tghack/gaiainvaders/PlayerShip;->position:Landroid/graphics/RectF;

    iget v0, v0, Landroid/graphics/RectF;->left:F

    iget v1, p0, Lno/tghack/gaiainvaders/PlayerShip;->screenX:I

    int-to-float v1, v1

    iget v2, p0, Lno/tghack/gaiainvaders/PlayerShip;->width:F

    sub-float/2addr v1, v2

    cmpg-float v0, v0, v1

    if-gez v0, :cond_1

    .line 63
    iget-object v0, p0, Lno/tghack/gaiainvaders/PlayerShip;->position:Landroid/graphics/RectF;

    iget v1, v0, Landroid/graphics/RectF;->left:F

    iget v2, p0, Lno/tghack/gaiainvaders/PlayerShip;->speed:F

    long-to-float p1, p1

    div-float/2addr v2, p1

    add-float/2addr v1, v2

    iput v1, v0, Landroid/graphics/RectF;->left:F

    .line 66
    :cond_1
    :goto_0
    iget-object p1, p0, Lno/tghack/gaiainvaders/PlayerShip;->position:Landroid/graphics/RectF;

    iget p2, p1, Landroid/graphics/RectF;->left:F

    iget v0, p0, Lno/tghack/gaiainvaders/PlayerShip;->width:F

    add-float/2addr p2, v0

    iput p2, p1, Landroid/graphics/RectF;->right:F

    return-void
.end method
