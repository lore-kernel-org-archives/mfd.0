Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84A9B33509B
	for <mfd@lists.linux.dev>; Fri, 16 Oct 2026 04:38:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792125504; cv=pass; b=RmgEfu6lcr++jh5j4MBv9T2XVSHHj3L8RbvZnzQMr05VlAV9cjqPjxjtWhLsiKHpDj8N2TjfPRqOc75KDaE2x5ofhPJx/AMUY3h7v4Xu2Z7mOBAIDPDc5kwMuROOL0O/jkzg4juDs46nbuTmLsszfzJ8KiXxVE+SGNBs8FP0OiU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792125504; c=relaxed/simple;
	bh=2rlenAEdNau3gkuJLtqbh74S+Iv9a38jmstY8ig7buo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bZlD6ohJW4ORiXKUL752BmS1CJYVw5Ytd+2CpqsMMINDfJYNLa1xmzgoE/h75wT6QzDPxC0GWw6SiOeipPxw3PTGRGRpVL6RBLIgI/hMks62QQFz/aEX9pc/YPZH5giFp6CpCjDrhPduMu1W7EW3bKBaNzgz1s6X/5VdfTy34/A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NBAbUiI0; arc=pass smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NBAbUiI0"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-6ae305e3bd9so8884797a12.0
        for <mfd@lists.linux.dev>; Thu, 15 Oct 2026 21:38:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792125502; cv=none;
        d=google.com; s=arc-20260327;
        b=Z1zuD/VKe5TgTk2zl5fleGjqbXuV0NLby3BFLHpQIrnRD55qmKybzgL+RRVUdeRcUP
         5o1FtsXAGe5LnldYfsLaDk3yHAAa+W53/b/diyta6HcmMzytun3Mg0Wol3jsifuNROvz
         J+ndtIBCsx85/DP7F7iJONZUKUH0eumsuQwvL+HSCpPHWry1+LEcHdCnyBtWPveZQr1r
         UE6xsGI0iK1TGQ51FHrM0ksrB3S6m8ZNVpFGaILTCHJp+5gWLwQ6tPpcIgx2TFw0/NXd
         19bpN8Lbda8WtQ0zAffFUWnMtfbs5vo+wJP1DWRjyMlmnZ2JRsERPwtcBz4VOlZLYdmJ
         abFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=k50iRYZEHIeglzuFdsPLFoaxWBDTeuPE91tn2Q2sZzI=;
        fh=6GVBBnUjXNTCQ1oFAIDphdXFtvSzC4kK0WQD2vOAwhM=;
        b=Pyo2blJipdypcnYAoTSd+A6SVrxsa2dh27q55l84E9ohkZri/mVT0jNPolFEkGKCt1
         50C0O0CzyOZm874Izl9BBN8UkfhAvyVXgPNYCveDTrVh5D2YV4Ovrd/E7zoaghx44YVb
         RiTIZgclbIzXpFP8A2B2tm9RBKaNt0CwvM9WJRfYw0Mbv1QCILtAkhmkNE991JcL0D57
         qJ6PXBq3QZ3j0pGieLkKNYViFEEV2v9v/9yMUNmp4Kglpmaou6tZAd0bs03lNYOOhdU/
         +6iyxaNPhscNhv9PNeyup1vEHOEM4l83H8NJefmVm37r7zPd2xws1v8WIjOAcpEp1pPf
         k3vA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792125502; x=1792730302; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=k50iRYZEHIeglzuFdsPLFoaxWBDTeuPE91tn2Q2sZzI=;
        b=NBAbUiI0cBuj3Tp3+FAhqnCyMnfPDJn6b5boPWq9F1t2mzI2hK5cLnBa25RYZF7AFd
         cMYRk3m/lq7WeZJ28ZLuDPpKY6cmtPx0IpdlINVGSURig2Re5M+PuDyxvg7KdmnFJXWU
         juAnF8GUR8gp+ojTH8fHL1aqBjYLwuTA3nQaVQ/+poZ80G959mbK31tgNAEy8WgDGQvw
         +xB8TgXNPCtboO2CoMHWKNO0AO8SfVxoUSoCMV+9Cnn4Ha8roKG3iOqpFqMb0H8Gpzl/
         p2PhlqLAz9ylE3feRKaHvAA/fz0DqIjdTUoNPyW5QTcI/+DxzVV0AWzF4q+bMI5v0rxa
         3/hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792125502; x=1792730302;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=k50iRYZEHIeglzuFdsPLFoaxWBDTeuPE91tn2Q2sZzI=;
        b=q2D1uxlgUEFUAIuwO46511YL9uw5C28hyY0j9azeewl1zHMoGxPZrSSUcqQHZl54jw
         UfeNa6H12tPMgDzCy0Xn/m8v+UdEgtSBWuRVso+h36dWR3r/cufrBL8nsU5N08zgZr1e
         y36usZ4DmP+jX1nnkfvj3m7+zNRQE3f740ue61fb7BZM7IyGCs8hXHwFtyd846dK8Hgr
         2D7SIghnu24nSkKUD0kJVza4KKTKdHOU5AHMKbB/DH5mPrQ0nObX+ShE8k5lplJ6usbj
         khA8GfUHmv/PznNS2GhnZIagZMjo4cNsxoqteE0Gn72FdhGKEHWj2jmTItExS8y0ZicN
         YXWg==
X-Gm-Message-State: AFq9FYJoGaf7j2jJTERyzcM43tpWfOUBcQBzDTpoRw3To0fi7CNRkcFA
	qUMeQuY6gFOLxyeU6TIK/8zPdLGu1/wobh+9E3vAGebHGwO77e+aIyZXUSzgbCPmrtKuJV3uGqz
	YS2DBC8Ig1x6GLMco+idtVQhsI8ebu7Y=
X-Gm-Gg: AYBFou0QVf/Su3++hY0lR90TolB7i/Z8IG2vAzcjdqHvwYEYU9R9XxvO/kDSuYaGUaW
	Ud6cDM2oy1IPlVs8Yn/MyXpUsRmuSIuxvZ4/exrZMyJJNlSZQxbMayhZGlTFXld+G3hWwzWSERh
	jG77l5plnpCsNjkpxh0nN1wMOZ1c0PVDSiWl5HMMWEJx4TrfrUEgoZHg0PrdUoLtDL2cBQVGHTM
	tfSgpV1x99GrF7G+V9QH9iNTIKsKu3llgkkEW5+rCLJaNDJ19YvF8kvz5etPC3m8S1OV9fXFDQf
	alTzUK4Z/3pXIa/jieWFujrt2qLA+up8YWsFuXzuj2s3p9ZrTmAzKO/WLhw6yt8Z1zPCJ1IaUGZ
	BmxoGQECjfA4ptZ1362BLkdN2GIh6rv5Xu8XDQp3NYrFwboHgjF0EWrJJOhSwXJaWWmVFsP+1Gg
	pyQeZM7TM1NBpSexgNbs6lvgR+GaWS5S/IA/vZ6ykZ/Fj/4L5+WSM59Z73Apc3XZCICQ==
X-Received: by 2002:a05:6402:c51a:10b0:6b1:801e:e01b with SMTP id
 4fb4d7f45d1cf-6b1801ee296mr11816181a12.20.1792125501771; Thu, 15 Oct 2026
 21:38:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260926013325.75073-1-rosenp@gmail.com> <179198497618.839288.9266863610003754798@kernel.org>
In-Reply-To: <179198497618.839288.9266863610003754798@kernel.org>
From: Rosen Penev <rosenp@gmail.com>
Date: Thu, 15 Oct 2026 21:38:10 -0700
X-Gm-Features: AclHuK_rJlPsw1gibHYA5u1PE6PZtVa-1YcLBoIsKBrVYTa4gD5TkF2K5Ui3F8s
Message-ID: <CAKxU2N_b-wxOuugVm7wzgh4RN9oUCNf1jnHYkKN0--MxHHA_tQ@mail.gmail.com>
Subject: Re: [PATCH v3] mfd: twl-core: Allocate modules with twl_private
To: Lee Jones <lee@kernel.org>
Cc: mfd@lists.linux.dev, Aaro Koskinen <aaro.koskinen@iki.fi>, 
	Andreas Kemnade <andreas@kemnade.info>, Kevin Hilman <khilman@baylibre.com>, 
	Roger Quadros <rogerq@kernel.org>, Tony Lindgren <tony@atomide.com>, 
	"OMAP2+ SUPPORT" <linux-omap@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 15, 2026 at 5:05=E2=80=AFAM Lee Jones <lee@kernel.org> wrote:
>
> On Fri, 25 Sep 2026, Rosen Penev wrote:
>
> > Use a flexible array member to allocate the twl_client array together
> > with struct twl_private. This removes a separate devm_kcalloc() and
> > keeps the module data tied to the main private structure.
> >
> > Signed-off-by: Rosen Penev <rosenp@gmail.com>
> > ---
> >  v3: Capitalize Allocate.
> >  v2: don't use twl_get_num_slaves().
> >  drivers/mfd/twl-core.c | 16 ++++------------
> >  1 file changed, 4 insertions(+), 12 deletions(-)
> >
> > diff --git a/drivers/mfd/twl-core.c b/drivers/mfd/twl-core.c
> > index f86df356d658..0b78fe30e047 100644
> > --- a/drivers/mfd/twl-core.c
> > +++ b/drivers/mfd/twl-core.c
> > @@ -159,7 +159,7 @@ struct twl_private {
> >       unsigned int twl_id;
> >
> >       struct twl_mapping *twl_map;
> > -     struct twl_client *twl_modules;
> > +     struct twl_client twl_modules[];
> >  };
> >
> >  static struct twl_private *twl_priv;
> > @@ -770,7 +770,9 @@ twl_probe(struct i2c_client *client)
> >               goto out;
> >       }
> >
> > -     twl_priv =3D devm_kzalloc(&client->dev, sizeof(struct twl_private=
),
> > +     num_slaves =3D (id->driver_data & TWL6030_CLASS) ? 3 : 4;
>
> What's wrong with twl_get_num_slaves()?
It relies on twl_priv already being allocated.
>
> > +     twl_priv =3D devm_kzalloc(&client->dev,
> > +                             struct_size(twl_priv, twl_modules, num_sl=
aves),
> >                               GFP_KERNEL);
> >       if (!twl_priv) {
> >               status =3D -ENOMEM;
> > @@ -787,16 +789,6 @@ twl_probe(struct i2c_client *client)
> >               twl_regmap_config =3D twl4030_regmap_config;
> >       }
> >
> > -     num_slaves =3D twl_get_num_slaves();
> > -     twl_priv->twl_modules =3D devm_kcalloc(&client->dev,
> > -                                      num_slaves,
> > -                                      sizeof(struct twl_client),
> > -                                      GFP_KERNEL);
> > -     if (!twl_priv->twl_modules) {
> > -             status =3D -ENOMEM;
> > -             goto out;
> > -     }
> > -
> >       for (i =3D 0; i < num_slaves; i++) {
> >               struct twl_client *twl =3D &twl_priv->twl_modules[i];
> >
> > --
> > 2.55.0
> >
>
> --
> Lee Jones
