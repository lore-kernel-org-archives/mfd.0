Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99E6E47DF8F
	for <mfd@lists.linux.dev>; Mon, 14 Sep 2026 14:26:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789396015; cv=pass; b=UtZgmRCJ9GvcZRE9JKb9z7mE9DZ7gUi0+iR9opeDFM1nZcTFOuQMe6yPUPbkMIqycGuFK8b/Y+0VWMtxNf3hS/Ahcad73h59EwzO4LdGmxFfBq2KJJlb2IETNtCD2w1unGz8LBjs9aMt/j+kXdLqF9Q6Sezr8MfpnapCg6+pEsc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789396015; c=relaxed/simple;
	bh=81vJhDkEw0hvn3+KQOXHxZ2yc0dONF02B9FfrP65Cdw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DMD5wDQFMzTchKuVDrKtApWFzPbXlthyGECIUi/WZT4Pvhc0YOaU4pg044TNeC2K0YbIsSeUiueaICymsNcV4cLerY+fPqwInhnfraFF2d9IodsscFdZhJ9NsNttJvSFM0t1owfutlEtyRrBFrTSI0QTLXKYnm6mQAUSRazK9Uw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net; spf=pass smtp.mailfrom=flipper.net; dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.b=NWM0bzfj; arc=pass smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flipper.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.b="NWM0bzfj"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-c294183384fso539419566b.1
        for <mfd@lists.linux.dev>; Mon, 14 Sep 2026 07:26:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789396012; cv=none;
        d=google.com; s=arc-20260327;
        b=ZLLetdV50nLybHB/T9e/a6r+cjm3saaA+WFCx829mRijTHHbcdp4clo1KIN7IlAH3h
         pQxpoto5FUs3ZvhIS/3KVp6ZE4n2rrjkudoNjMFCLDy0GpLBKo1CtA8fA+6/GZb0w4Ez
         uSwbtW171w1MGV0CA6eNhRUt1fpRNhMt7crUQB6vpacXiWXqeO+AKocpqdubIPvJdM1d
         oY13Qbgd/NyJDAPylmcVRYglo5hgAwn/RC05umV+QKuN7u7hXG+MAVFvYebIg3PgU+OR
         d9gfL7X4NJIWuni5zbtIv6rjHzM8eCnsBh7fFKZiJLvKO/RPzBbS7zHuNWsQPL3FWYfk
         GVwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=3SRl5RlCoBEMdB/onhWIkx4Vv9NPOyhwv41Rqd2HgvQ=;
        fh=6j/Dplj3AXGxO/ku1ACIUV5HaNtPbcETuaNBxeCMOdQ=;
        b=USpOIffBVWuk8hvb5yfJUEd1yfaOnjPi78NH1szB7ZjVzPXWarTIWuKbKZiP+QWZqp
         yW4maxJ7w3NzZMfxnXrvtWPDW7n+IvxaYGpRCBmy043yafAGpCZguD4r0XsKh5+JYfUd
         4xVgj+45n9rxs/SlhIG1HOCj4qqXe0GOx0jR97A1NIU+JAdEoUpovpEKlX4glo0hqCsK
         TjZ1I4DLXA6BFOyAnvTPd1YgEFBJEpPUB+QXtmnj/wB2n31jPhEMXMWH4M2h+6ETJNMb
         CxkMlDOZBWFrTTKN0BjdBadpH8GQyCovVqnmn/AMuZYArlQ9u7FXoQg9fMtxVPXvFOs/
         rYHg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1789396012; x=1790000812; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3SRl5RlCoBEMdB/onhWIkx4Vv9NPOyhwv41Rqd2HgvQ=;
        b=NWM0bzfjuGwVd9Ovtams+A46oWIVPXg5wp5zdhiiNamhkbSbh/tLa50ONIj2eUmPHp
         fvwTwi74YOVrbJh3wLkQfU0RE7IdwWB0VDgS94cxo+RA3JGloRHWH0euRKXbf321hWuf
         Z52DtgX68S5wowcYvnBbppkN9NtRwl1jc9BM49m+j+LjQz8CMKcMyRJApQr63eVOaGo4
         fq0I9i+yoVQQnSPp++qoCZuqd6VJhpX50SfTpsyqDyC6jS5obB07zWAjKz9av8VHZe3m
         0VqCrHIKV6woOMXgqtAs5MyGOpckxQ/wKS0mfrGzrOTGqLph/ehbBHfUxFQLSV//zts9
         xLuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789396012; x=1790000812;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3SRl5RlCoBEMdB/onhWIkx4Vv9NPOyhwv41Rqd2HgvQ=;
        b=UvXSqf58yqAJBo39EDtd82aQt8v3cLR8EieBX2R8wx/5LPAZkLblJRXuUI7K6hJ83p
         kMrZSLUm/escaHqWjryWEJLLZpupkCDoXsz9ymaedC+nnJzaHkQ3sXtRaE47t+XimMlW
         IfwuANSxGWH5YAzxmahf9wVaro94wEGLi7GVU+PMP36M7SczmypY7pYx+dXG7sdwe56R
         Syilzunx19SDqEMY3jDfu2iEHj7hZhC4VoLyN3rMBq+QH2mYnKbb4vm3YAHUbQZolBy7
         x/94NGesfa4afcKZ0PjUHHRH6av8FK+wlWeKF5R6yj6DuikyIQi7PXtioTrTk7djuGPu
         /tsw==
X-Gm-Message-State: AFuF++nKIeUzCXVzX4mb/J8fhL7vXieMmPa/7zRlJWfx6qNKGHoymYqy
	fbQYb2L5MS4BSs2qqXJQgEb/ZmcUqo1sDR9q85R/UsJm3zb/9z5Krn053/x9TpnMxjK40SADG6R
	RsDb9UtIxQL63YWugN8akzSzSgWWi9VTsyk+n/TiiQg==
X-Gm-Gg: AYBFou3uDpseE+cN9ynwWgYUYsGIoCVn5Kz9xGWrHo9ugE8vPZnnF4QG38tjRNXkZ63
	NGOKaRArEZVAybZmx7caZlkMGbtBrBNxXEtrkrE+kRY3rHqHDoppkqPs4ltSQHJB6uCkzxbnRSr
	2Lk/W8kGnzAGz6/mngAiBIVRlcjXHrL1+PZz6Uty4Mde/F2O220kC5b97atQbLCYvP3C8uMmEKn
	4MDF/0t5ZQJB25P5Cra5Umk33dBC9sXSXHmm5TpMsFCIh3UPuSbZeeSdXsZT2BT/F0yYKxZExZk
	xavFWTsD7hV2GWfx4wrB8vgnDgq06Gue16VuFxF80QD/qAPVCxLpr1A=
X-Received: by 2002:a17:907:1c1f:b0:c29:3bc7:c13 with SMTP id
 a640c23a62f3a-c29b861ead8mr178688066b.4.1789396011638; Mon, 14 Sep 2026
 07:26:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260914-bq25798-v1-1-dc5e2ec343c4@flipper.net> <20260914140821.269AC1F00893@smtp.kernel.org>
In-Reply-To: <20260914140821.269AC1F00893@smtp.kernel.org>
From: Alexey Charkov <alchark@flipper.net>
Date: Mon, 14 Sep 2026 18:26:44 +0400
X-Gm-Features: AcwNN1URozr7S4_r01G8CCPPRVZ26CghHbia4XeX1NY-TwCeIavw2uWVQYPLnZ0
Message-ID: <CAKTNdwGnbzJnvxdGJa58wf_ab8RPBurjPSt7uxXno-z8sqdqxg@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: mfd: ti,bq25703a: Expand to include BQ25798
To: sashiko-reviews@lists.linux.dev
Cc: mfd@lists.linux.dev, robh@kernel.org, conor+dt@kernel.org, lee@kernel.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 14, 2026 at 6:08=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [Medium] Adding an array-based fallback compatible string without updat=
ing the `if: properties: compatible: const:` conditionals causes the new co=
mpatible to bypass device-specific schema constraints.
> --
>
> commit 37d04d6cb52639a3cc4ba9ade1878fa540a5cb3e
> Author: Alexey Charkov <alchark@flipper.net>
>
> dt-bindings: mfd: ti,bq25703a: Expand to include BQ25798
>
> TI has unpublished the BQ25792 charger variant and pulled its docs from
> their website. BQ25798 is a pin and register compatible replacement. Expa=
nd
> the existing binding to include BQ25798 with a fallback compatible to
> BQ25792.
>
> Link: https://www.ti.com/product/BQ25798
>
> > diff --git a/Documentation/devicetree/bindings/mfd/ti,bq25703a.yaml b/D=
ocumentation/devicetree/bindings/mfd/ti,bq25703a.yaml
> > index cdce83f058041..43afd232a6142 100644
> > --- a/Documentation/devicetree/bindings/mfd/ti,bq25703a.yaml
> > +++ b/Documentation/devicetree/bindings/mfd/ti,bq25703a.yaml
> > @@ -11,9 +11,14 @@ maintainers:
> >
> >  properties:
> >    compatible:
> > -    enum:
> > -      - ti,bq25703a
> > -      - ti,bq25792
> > +    oneOf:
> > +      - enum:
> > +          - ti,bq25703a
> > +          - ti,bq25792
> > +      - items:
> > +          - enum:
> > +              - ti,bq25798
> > +          - const: ti,bq25792
>
> [Severity: Medium]
> Is this a regression that causes the new compatible string to bypass
> device-specific schema constraints?
>
> Later in the file's allOf/if section, there is an exact match condition
> for the ti,bq25792 compatible string:
>
>   - if:
>       properties:
>         compatible:
>           const: ti,bq25792
>
> Since the schema const keyword mandates strict equality, it will fail to
> match the fallback array ["ti,bq25798", "ti,bq25792"]. As a result, if a
> devicetree author specifies compatible =3D "ti,bq25798", "ti,bq25792" and
> configures out-of-bounds regulator or current values, the device-specific
> hardware constraints for ti,bq25792 will not be applied during validation=
.
>
> Could this if condition be updated to use contains instead of const, or
> otherwise include the new fallback array?

Fair point, will address in v2.

Best regards,
Alexey
