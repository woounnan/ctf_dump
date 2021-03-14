.class public final Lno/tghack/gaiainvaders/Invader;
.super Ljava/lang/Object;
.source "Invader.kt"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lno/tghack/gaiainvaders/Invader$Companion;
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    bv = {
        0x1,
        0x0,
        0x3
    }
    d1 = {
        "\u0000>\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0008\n\u0002\u0008\u0005\n\u0002\u0010\u0007\n\u0000\n\u0002\u0010\u000b\n\u0002\u0008\u0006\n\u0002\u0018\u0002\n\u0002\u0008\r\n\u0002\u0010\u0002\n\u0002\u0008\u0007\n\u0002\u0010\t\n\u0002\u0008\u0002\u0018\u0000 +2\u00020\u0001:\u0001+B-\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0005\u0012\u0006\u0010\u0006\u001a\u00020\u0005\u0012\u0006\u0010\u0007\u001a\u00020\u0005\u0012\u0006\u0010\u0008\u001a\u00020\u0005\u00a2\u0006\u0002\u0010\tJ\u000e\u0010!\u001a\u00020\"2\u0006\u0010#\u001a\u00020\u0005J\u001e\u0010$\u001a\u00020\r2\u0006\u0010%\u001a\u00020\u000b2\u0006\u0010&\u001a\u00020\u000b2\u0006\u0010\'\u001a\u00020\u0005J\u000e\u0010(\u001a\u00020\"2\u0006\u0010)\u001a\u00020*R\u000e\u0010\n\u001a\u00020\u000bX\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u001a\u0010\u000c\u001a\u00020\rX\u0086\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\u0008\u000c\u0010\u000e\"\u0004\u0008\u000f\u0010\u0010R\u000e\u0010\u0011\u001a\u00020\u0005X\u0082D\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0012\u001a\u00020\u0005X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u001a\u0010\u0013\u001a\u00020\u0014X\u0086\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\u0008\u0015\u0010\u0016\"\u0004\u0008\u0017\u0010\u0018R\u000e\u0010\u0019\u001a\u00020\u0005X\u0082D\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u001a\u001a\u00020\u0005X\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u001b\u001a\u00020\u000bX\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u001a\u0010\u001c\u001a\u00020\u000bX\u0086\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\u0008\u001d\u0010\u001e\"\u0004\u0008\u001f\u0010 \u00a8\u0006,"
    }
    d2 = {
        "Lno/tghack/gaiainvaders/Invader;",
        "",
        "context",
        "Landroid/content/Context;",
        "row",
        "",
        "column",
        "screenX",
        "screenY",
        "(Landroid/content/Context;IIII)V",
        "height",
        "",
        "isVisible",
        "",
        "()Z",
        "setVisible",
        "(Z)V",
        "left",
        "padding",
        "position",
        "Landroid/graphics/RectF;",
        "getPosition",
        "()Landroid/graphics/RectF;",
        "setPosition",
        "(Landroid/graphics/RectF;)V",
        "right",
        "shipMoving",
        "speed",
        "width",
        "getWidth",
        "()F",
        "setWidth",
        "(F)V",
        "dropDownAndReverse",
        "",
        "waveNumber",
        "takeAim",
        "playerShipX",
        "playerShipLength",
        "waves",
        "update",
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
.field public static final Companion:Lno/tghack/gaiainvaders/Invader$Companion;

.field private static bitmap1:Landroid/graphics/Bitmap;

.field private static bitmap2:Landroid/graphics/Bitmap;

.field private static numberOfInvaders:I


# instance fields
.field private height:F

.field private isVisible:Z

.field private final left:I

.field private final padding:I

.field private position:Landroid/graphics/RectF;

.field private final right:I

.field private shipMoving:I

.field private speed:F

.field private width:F


# direct methods
.method static constructor <clinit>()V
    .locals 2

    new-instance v0, Lno/tghack/gaiainvaders/Invader$Companion;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lno/tghack/gaiainvaders/Invader$Companion;-><init>(Lkotlin/jvm/internal/DefaultConstructorMarker;)V

    sput-object v0, Lno/tghack/gaiainvaders/Invader;->Companion:Lno/tghack/gaiainvaders/Invader$Companion;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;IIII)V
    .locals 5

    const-string v0, "context"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkParameterIsNotNull(Ljava/lang/Object;Ljava/lang/String;)V

    .line 9
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    int-to-float v0, p4

    const/high16 v1, 0x41a00000    # 20.0f

    div-float/2addr v0, v1

    .line 11
    iput v0, p0, Lno/tghack/gaiainvaders/Invader;->width:F

    int-to-float p5, p5

    const/high16 v0, 0x41f00000    # 30.0f

    div-float/2addr p5, v0

    .line 12
    iput p5, p0, Lno/tghack/gaiainvaders/Invader;->height:F

    .line 13
    div-int/lit8 p4, p4, 0x2d

    iput p4, p0, Lno/tghack/gaiainvaders/Invader;->padding:I

    .line 15
    new-instance p4, Landroid/graphics/RectF;

    int-to-float p3, p3

    .line 16
    iget p5, p0, Lno/tghack/gaiainvaders/Invader;->width:F

    iget v0, p0, Lno/tghack/gaiainvaders/Invader;->padding:I

    int-to-float v1, v0

    add-float/2addr v1, p5

    mul-float v1, v1, p3

    const/16 v2, 0x64

    int-to-float v2, v2

    add-float/2addr v1, v2

    const/16 v3, 0x87

    int-to-float v3, v3

    int-to-float p2, p2

    .line 17
    div-int/lit8 v4, v0, 0x4

    int-to-float v4, v4

    add-float/2addr v4, p5

    mul-float v4, v4, p2

    add-float/2addr v3, v4

    int-to-float v4, v0

    add-float/2addr v4, p5

    mul-float p3, p3, v4

    add-float/2addr p3, p5

    add-float/2addr p3, v2

    .line 19
    div-int/lit8 v0, v0, 0x4

    int-to-float v0, v0

    add-float/2addr p5, v0

    mul-float p2, p2, p5

    add-float/2addr v2, p2

    iget p2, p0, Lno/tghack/gaiainvaders/Invader;->height:F

    add-float/2addr v2, p2

    .line 15
    invoke-direct {p4, v1, v3, p3, v2}, Landroid/graphics/RectF;-><init>(FFFF)V

    iput-object p4, p0, Lno/tghack/gaiainvaders/Invader;->position:Landroid/graphics/RectF;

    const/high16 p2, 0x42200000    # 40.0f

    .line 23
    iput p2, p0, Lno/tghack/gaiainvaders/Invader;->speed:F

    const/4 p2, 0x1

    .line 25
    iput p2, p0, Lno/tghack/gaiainvaders/Invader;->left:I

    const/4 p3, 0x2

    .line 26
    iput p3, p0, Lno/tghack/gaiainvaders/Invader;->right:I

    .line 29
    iget p3, p0, Lno/tghack/gaiainvaders/Invader;->right:I

    iput p3, p0, Lno/tghack/gaiainvaders/Invader;->shipMoving:I

    .line 31
    iput-boolean p2, p0, Lno/tghack/gaiainvaders/Invader;->isVisible:Z

    .line 46
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p3

    const p4, 0x7f070058

    .line 45
    invoke-static {p3, p4}, Landroid/graphics/BitmapFactory;->decodeResource(Landroid/content/res/Resources;I)Landroid/graphics/Bitmap;

    move-result-object p3

    sput-object p3, Lno/tghack/gaiainvaders/Invader;->bitmap1:Landroid/graphics/Bitmap;

    .line 51
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    const p3, 0x7f070059

    .line 50
    invoke-static {p1, p3}, Landroid/graphics/BitmapFactory;->decodeResource(Landroid/content/res/Resources;I)Landroid/graphics/Bitmap;

    move-result-object p1

    sput-object p1, Lno/tghack/gaiainvaders/Invader;->bitmap2:Landroid/graphics/Bitmap;

    .line 58
    sget-object p1, Lno/tghack/gaiainvaders/Invader;->bitmap1:Landroid/graphics/Bitmap;

    if-nez p1, :cond_0

    invoke-static {}, Lkotlin/jvm/internal/Intrinsics;->throwNpe()V

    .line 59
    :cond_0
    iget p3, p0, Lno/tghack/gaiainvaders/Invader;->width:F

    float-to-int p3, p3

    .line 60
    iget p4, p0, Lno/tghack/gaiainvaders/Invader;->height:F

    float-to-int p4, p4

    const/4 p5, 0x0

    .line 57
    invoke-static {p1, p3, p4, p5}, Landroid/graphics/Bitmap;->createScaledBitmap(Landroid/graphics/Bitmap;IIZ)Landroid/graphics/Bitmap;

    move-result-object p1

    sput-object p1, Lno/tghack/gaiainvaders/Invader;->bitmap1:Landroid/graphics/Bitmap;

    .line 65
    sget-object p1, Lno/tghack/gaiainvaders/Invader;->bitmap2:Landroid/graphics/Bitmap;

    if-nez p1, :cond_1

    invoke-static {}, Lkotlin/jvm/internal/Intrinsics;->throwNpe()V

    .line 66
    :cond_1
    iget p3, p0, Lno/tghack/gaiainvaders/Invader;->width:F

    float-to-int p3, p3

    .line 67
    iget p4, p0, Lno/tghack/gaiainvaders/Invader;->height:F

    float-to-int p4, p4

    .line 64
    invoke-static {p1, p3, p4, p5}, Landroid/graphics/Bitmap;->createScaledBitmap(Landroid/graphics/Bitmap;IIZ)Landroid/graphics/Bitmap;

    move-result-object p1

    sput-object p1, Lno/tghack/gaiainvaders/Invader;->bitmap2:Landroid/graphics/Bitmap;

    .line 70
    sget p1, Lno/tghack/gaiainvaders/Invader;->numberOfInvaders:I

    add-int/2addr p1, p2

    sput p1, Lno/tghack/gaiainvaders/Invader;->numberOfInvaders:I

    return-void
.end method

.method public static final synthetic access$getBitmap1$cp()Landroid/graphics/Bitmap;
    .locals 1

    .line 9
    sget-object v0, Lno/tghack/gaiainvaders/Invader;->bitmap1:Landroid/graphics/Bitmap;

    return-object v0
.end method

.method public static final synthetic access$getBitmap2$cp()Landroid/graphics/Bitmap;
    .locals 1

    .line 9
    sget-object v0, Lno/tghack/gaiainvaders/Invader;->bitmap2:Landroid/graphics/Bitmap;

    return-object v0
.end method

.method public static final synthetic access$getNumberOfInvaders$cp()I
    .locals 1

    .line 9
    sget v0, Lno/tghack/gaiainvaders/Invader;->numberOfInvaders:I

    return v0
.end method

.method public static final synthetic access$setBitmap1$cp(Landroid/graphics/Bitmap;)V
    .locals 0

    .line 9
    sput-object p0, Lno/tghack/gaiainvaders/Invader;->bitmap1:Landroid/graphics/Bitmap;

    return-void
.end method

.method public static final synthetic access$setBitmap2$cp(Landroid/graphics/Bitmap;)V
    .locals 0

    .line 9
    sput-object p0, Lno/tghack/gaiainvaders/Invader;->bitmap2:Landroid/graphics/Bitmap;

    return-void
.end method

.method public static final synthetic access$setNumberOfInvaders$cp(I)V
    .locals 0

    .line 9
    sput p0, Lno/tghack/gaiainvaders/Invader;->numberOfInvaders:I

    return-void
.end method


# virtual methods
.method public final dropDownAndReverse(I)V
    .locals 3

    .line 86
    iget v0, p0, Lno/tghack/gaiainvaders/Invader;->shipMoving:I

    iget v1, p0, Lno/tghack/gaiainvaders/Invader;->left:I

    if-ne v0, v1, :cond_0

    .line 87
    iget v1, p0, Lno/tghack/gaiainvaders/Invader;->right:I

    .line 86
    :cond_0
    iput v1, p0, Lno/tghack/gaiainvaders/Invader;->shipMoving:I

    .line 92
    iget-object v0, p0, Lno/tghack/gaiainvaders/Invader;->position:Landroid/graphics/RectF;

    iget v1, v0, Landroid/graphics/RectF;->top:F

    iget v2, p0, Lno/tghack/gaiainvaders/Invader;->height:F

    add-float/2addr v1, v2

    iput v1, v0, Landroid/graphics/RectF;->top:F

    .line 93
    iget-object v0, p0, Lno/tghack/gaiainvaders/Invader;->position:Landroid/graphics/RectF;

    iget v1, v0, Landroid/graphics/RectF;->bottom:F

    iget v2, p0, Lno/tghack/gaiainvaders/Invader;->height:F

    add-float/2addr v1, v2

    iput v1, v0, Landroid/graphics/RectF;->bottom:F

    .line 96
    iget v0, p0, Lno/tghack/gaiainvaders/Invader;->speed:F

    const v1, 0x3f8ccccd    # 1.1f

    int-to-float p1, p1

    const/16 v2, 0x14

    int-to-float v2, v2

    div-float/2addr p1, v2

    add-float/2addr p1, v1

    mul-float v0, v0, p1

    iput v0, p0, Lno/tghack/gaiainvaders/Invader;->speed:F

    return-void
.end method

.method public final getPosition()Landroid/graphics/RectF;
    .locals 1

    .line 15
    iget-object v0, p0, Lno/tghack/gaiainvaders/Invader;->position:Landroid/graphics/RectF;

    return-object v0
.end method

.method public final getWidth()F
    .locals 1

    .line 11
    iget v0, p0, Lno/tghack/gaiainvaders/Invader;->width:F

    return v0
.end method

.method public final isVisible()Z
    .locals 1

    .line 31
    iget-boolean v0, p0, Lno/tghack/gaiainvaders/Invader;->isVisible:Z

    return v0
.end method

.method public final setPosition(Landroid/graphics/RectF;)V
    .locals 1

    const-string v0, "<set-?>"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkParameterIsNotNull(Ljava/lang/Object;Ljava/lang/String;)V

    .line 15
    iput-object p1, p0, Lno/tghack/gaiainvaders/Invader;->position:Landroid/graphics/RectF;

    return-void
.end method

.method public final setVisible(Z)V
    .locals 0

    .line 31
    iput-boolean p1, p0, Lno/tghack/gaiainvaders/Invader;->isVisible:Z

    return-void
.end method

.method public final setWidth(F)V
    .locals 0

    .line 11
    iput p1, p0, Lno/tghack/gaiainvaders/Invader;->width:F

    return-void
.end method

.method public final takeAim(FFI)Z
    .locals 4

    .line 104
    new-instance v0, Ljava/util/Random;

    invoke-direct {v0}, Ljava/util/Random;-><init>()V

    add-float/2addr p2, p1

    .line 108
    iget-object v1, p0, Lno/tghack/gaiainvaders/Invader;->position:Landroid/graphics/RectF;

    iget v1, v1, Landroid/graphics/RectF;->left:F

    const/4 v2, 0x1

    cmpl-float v1, p2, v1

    if-lez v1, :cond_0

    .line 109
    iget-object v1, p0, Lno/tghack/gaiainvaders/Invader;->position:Landroid/graphics/RectF;

    iget v1, v1, Landroid/graphics/RectF;->left:F

    iget v3, p0, Lno/tghack/gaiainvaders/Invader;->width:F

    add-float/2addr v1, v3

    cmpg-float p2, p2, v1

    if-ltz p2, :cond_1

    :cond_0
    iget-object p2, p0, Lno/tghack/gaiainvaders/Invader;->position:Landroid/graphics/RectF;

    iget p2, p2, Landroid/graphics/RectF;->left:F

    cmpl-float p2, p1, p2

    if-lez p2, :cond_2

    .line 110
    iget-object p2, p0, Lno/tghack/gaiainvaders/Invader;->position:Landroid/graphics/RectF;

    iget p2, p2, Landroid/graphics/RectF;->left:F

    iget v1, p0, Lno/tghack/gaiainvaders/Invader;->width:F

    add-float/2addr p2, v1

    cmpg-float p1, p1, p2

    if-gez p1, :cond_2

    .line 114
    :cond_1
    sget p1, Lno/tghack/gaiainvaders/Invader;->numberOfInvaders:I

    mul-int/lit8 p1, p1, 0x64

    invoke-virtual {v0, p1}, Ljava/util/Random;->nextInt(I)I

    move-result p1

    div-int/2addr p1, p3

    if-nez p1, :cond_2

    return v2

    .line 122
    :cond_2
    sget p1, Lno/tghack/gaiainvaders/Invader;->numberOfInvaders:I

    mul-int/lit16 p1, p1, 0x96

    invoke-virtual {v0, p1}, Ljava/util/Random;->nextInt(I)I

    move-result p1

    if-nez p1, :cond_3

    goto :goto_0

    :cond_3
    const/4 v2, 0x0

    :goto_0
    return v2
.end method

.method public final update(J)V
    .locals 4

    .line 74
    iget v0, p0, Lno/tghack/gaiainvaders/Invader;->shipMoving:I

    iget v1, p0, Lno/tghack/gaiainvaders/Invader;->left:I

    if-ne v0, v1, :cond_0

    .line 75
    iget-object v0, p0, Lno/tghack/gaiainvaders/Invader;->position:Landroid/graphics/RectF;

    iget v1, v0, Landroid/graphics/RectF;->left:F

    iget v2, p0, Lno/tghack/gaiainvaders/Invader;->speed:F

    long-to-float v3, p1

    div-float/2addr v2, v3

    sub-float/2addr v1, v2

    iput v1, v0, Landroid/graphics/RectF;->left:F

    .line 78
    :cond_0
    iget v0, p0, Lno/tghack/gaiainvaders/Invader;->shipMoving:I

    iget v1, p0, Lno/tghack/gaiainvaders/Invader;->right:I

    if-ne v0, v1, :cond_1

    .line 79
    iget-object v0, p0, Lno/tghack/gaiainvaders/Invader;->position:Landroid/graphics/RectF;

    iget v1, v0, Landroid/graphics/RectF;->left:F

    iget v2, p0, Lno/tghack/gaiainvaders/Invader;->speed:F

    long-to-float p1, p1

    div-float/2addr v2, p1

    add-float/2addr v1, v2

    iput v1, v0, Landroid/graphics/RectF;->left:F

    .line 82
    :cond_1
    iget-object p1, p0, Lno/tghack/gaiainvaders/Invader;->position:Landroid/graphics/RectF;

    iget p2, p1, Landroid/graphics/RectF;->left:F

    iget v0, p0, Lno/tghack/gaiainvaders/Invader;->width:F

    add-float/2addr p2, v0

    iput p2, p1, Landroid/graphics/RectF;->right:F

    return-void
.end method
