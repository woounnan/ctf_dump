.class public final Lno/tghack/gaiainvaders/DefenceBrick;
.super Ljava/lang/Object;
.source "DefenceBrick.kt"


# annotations
.annotation runtime Lkotlin/Metadata;
    bv = {
        0x1,
        0x0,
        0x3
    }
    d1 = {
        "\u0000*\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u0008\n\u0002\u0008\u0008\n\u0002\u0010\u000b\n\u0002\u0008\u0004\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0010\u0007\n\u0002\u0008\u0003\u0018\u00002\u00020\u0001B-\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0003\u0012\u0006\u0010\u0005\u001a\u00020\u0003\u0012\u0006\u0010\u0006\u001a\u00020\u0003\u0012\u0006\u0010\u0007\u001a\u00020\u0003\u00a2\u0006\u0002\u0010\u0008R\u000e\u0010\t\u001a\u00020\u0003X\u0082D\u00a2\u0006\u0002\n\u0000R\u000e\u0010\n\u001a\u00020\u0003X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u001a\u0010\u000b\u001a\u00020\u000cX\u0086\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\u0008\u000b\u0010\r\"\u0004\u0008\u000e\u0010\u000fR\u0011\u0010\u0010\u001a\u00020\u0011\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0012\u0010\u0013R\u000e\u0010\u0014\u001a\u00020\u0015X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0016\u001a\u00020\u0015X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0017\u001a\u00020\u0003X\u0082\u0004\u00a2\u0006\u0002\n\u0000\u00a8\u0006\u0018"
    }
    d2 = {
        "Lno/tghack/gaiainvaders/DefenceBrick;",
        "",
        "row",
        "",
        "column",
        "shelterNumber",
        "screenX",
        "screenY",
        "(IIIII)V",
        "brickPadding",
        "height",
        "isVisible",
        "",
        "()Z",
        "setVisible",
        "(Z)V",
        "position",
        "Landroid/graphics/RectF;",
        "getPosition",
        "()Landroid/graphics/RectF;",
        "shelterPadding",
        "",
        "startHeight",
        "width",
        "app_release"
    }
    k = 0x1
    mv = {
        0x1,
        0x1,
        0x10
    }
.end annotation


# instance fields
.field private final brickPadding:I

.field private final height:I

.field private isVisible:Z

.field private final position:Landroid/graphics/RectF;

.field private final shelterPadding:F

.field private final startHeight:F

.field private final width:I


# direct methods
.method public constructor <init>(IIIII)V
    .locals 6

    .line 6
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x1

    .line 8
    iput-boolean v0, p0, Lno/tghack/gaiainvaders/DefenceBrick;->isVisible:Z

    .line 10
    div-int/lit8 v1, p4, 0x78

    iput v1, p0, Lno/tghack/gaiainvaders/DefenceBrick;->width:I

    .line 11
    div-int/lit8 v1, p5, 0x32

    iput v1, p0, Lno/tghack/gaiainvaders/DefenceBrick;->height:I

    .line 15
    iput v0, p0, Lno/tghack/gaiainvaders/DefenceBrick;->brickPadding:I

    int-to-float p4, p4

    const/high16 v0, 0x41400000    # 12.0f

    div-float/2addr p4, v0

    .line 18
    iput p4, p0, Lno/tghack/gaiainvaders/DefenceBrick;->shelterPadding:F

    int-to-float p4, p5

    const/high16 p5, 0x41200000    # 10.0f

    div-float p5, p4, p5

    const/high16 v0, 0x40800000    # 4.0f

    mul-float p5, p5, v0

    sub-float/2addr p4, p5

    .line 19
    iput p4, p0, Lno/tghack/gaiainvaders/DefenceBrick;->startHeight:F

    .line 21
    new-instance p4, Landroid/graphics/RectF;

    iget p5, p0, Lno/tghack/gaiainvaders/DefenceBrick;->width:I

    mul-int v0, p2, p5

    iget v1, p0, Lno/tghack/gaiainvaders/DefenceBrick;->brickPadding:I

    add-int/2addr v0, v1

    int-to-float v0, v0

    .line 22
    iget v2, p0, Lno/tghack/gaiainvaders/DefenceBrick;->shelterPadding:F

    int-to-float p3, p3

    mul-float v3, v2, p3

    add-float/2addr v0, v3

    add-float/2addr v0, v2

    mul-float v3, v2, p3

    add-float/2addr v0, v3

    .line 24
    iget v3, p0, Lno/tghack/gaiainvaders/DefenceBrick;->height:I

    mul-int v4, p1, v3

    add-int/2addr v4, v1

    int-to-float v4, v4

    iget v5, p0, Lno/tghack/gaiainvaders/DefenceBrick;->startHeight:F

    add-float/2addr v4, v5

    mul-int p2, p2, p5

    add-int/2addr p2, p5

    sub-int/2addr p2, v1

    int-to-float p2, p2

    mul-float p5, v2, p3

    add-float/2addr p2, p5

    add-float/2addr p2, v2

    mul-float v2, v2, p3

    add-float/2addr p2, v2

    mul-int p1, p1, v3

    add-int/2addr p1, v3

    sub-int/2addr p1, v1

    int-to-float p1, p1

    add-float/2addr p1, v5

    .line 21
    invoke-direct {p4, v0, v4, p2, p1}, Landroid/graphics/RectF;-><init>(FFFF)V

    iput-object p4, p0, Lno/tghack/gaiainvaders/DefenceBrick;->position:Landroid/graphics/RectF;

    return-void
.end method


# virtual methods
.method public final getPosition()Landroid/graphics/RectF;
    .locals 1

    .line 21
    iget-object v0, p0, Lno/tghack/gaiainvaders/DefenceBrick;->position:Landroid/graphics/RectF;

    return-object v0
.end method

.method public final isVisible()Z
    .locals 1

    .line 8
    iget-boolean v0, p0, Lno/tghack/gaiainvaders/DefenceBrick;->isVisible:Z

    return v0
.end method

.method public final setVisible(Z)V
    .locals 0

    .line 8
    iput-boolean p1, p0, Lno/tghack/gaiainvaders/DefenceBrick;->isVisible:Z

    return-void
.end method
