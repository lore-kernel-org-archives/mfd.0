Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=74.125.82.178
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1794384251;
	b=uZiuTMyz9G32e9YivqgXl8VGRWOFKZVthRuMANgeOq5yjJ1hrwkfaAD7wLG3T2y2hReW
	 aw0ZKu39+y9yxlKibiNR06+0wy2kCaUjCxiBjoYNUyGYyQHlSKewgtnjsEX/66CwvvSg6
	 pew3U2GaDKOomZ0sM7dDdDGBJJlSJ9l7VBN6o00A4A0BMDS56LiAzwrhGwGURkvgX2Cq0
	 j9hrh/vxgDCr6RaukY1ZBtKQOICBoOP4XlZ+0YrAUmRno6X8sAdC/mfNV4pec82oIzpwX
	 DuHCT2vYRbtQsCLtIBd4xU946/WTqUl5VOZyLwv0bWfrYf1aIBXmFCD6tMv+peC3WvQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794384251;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=e02CISDat2rnFU5auy1swbmNQ1NAggjZWxzVKQlZOt0=;
	b=WQkZHx2nGHqGg+wLY+UPx1Bpq2zXn/gGqvoGWpyIzg2dpI8eeA5y25m2xGENyhuf/fv+
	 kbK0ulb2nABExlFLaKhQlX7ROGQs1Wz71EzWcZejuBSu0XxupS5/Grfn5kAx2a2WgyQ7p
	 Tm4uoOhAqOugCIge4FjNU8e5rMZ6H1RpBNfKpOdhNIdOrs3WJLxR3M8Yc35oJUExi7EO6
	 3hym2WhvupB1bmBD9XgMo0C0kieSzYgLj+MBp63VGiRqF5ohxRbdHnYOP6CLq1CbvwDaq
	 LExhFVyFR8Amwzs7v68py4jwJa/GnHxsUSm1NRru5A1oM0IsJcjQO6tIaWsp2DX95IQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YtHy69D8;
	arc=fail smtp.remote-ip=74.125.82.178
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A904D606A324
	for <mfd@lists.linux.dev>; Wed, 11 Nov 2026 08:04:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A904D606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YtHy69D8
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-3700ed8dbe3so5093740eec.0
        for <mfd@lists.linux.dev>; Wed, 11 Nov 2026 00:04:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794384250; cv=none;
        d=google.com; s=arc-20260327;
        b=d63XF8o5owMN0z9YaxjmAuPFOT0OzOB4PFn5oIUOD7GE50HEJfg2ilwphK+m401vTU
         AMHJWqrTfyC3L5bS3xnPpLEvroIpdPsNVzihj3BOGJSnLSQb1tpz+eCBYxsNeEeR1PLS
         Zn3gcB/8NlA7Sw/cjoIT3lpaWLQdowzVDLPka/oZECnO2CwntrbEnEQGChGIv+2UJt+c
         DFfGoQyua9UiitEupJWzxmzaDMoOR7W/maz/3UfDndMstGTjbmzdGZS0WrcKXZyn3zq5
         Ej5YPMLMhuD0jHIY2hZVFGwxg/3q/HIXX9yNxsKfmPtB7rw5+WXwnaA2Iz3Qgx8TFweE
         ai9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=e02CISDat2rnFU5auy1swbmNQ1NAggjZWxzVKQlZOt0=;
        fh=CONJZfF9dOXfvaiHu7uIiWKb3ir4iZD3ghR4Zq80Y94=;
        b=fNvJiqZhoZcEbHksIZRoa+zrcCh3EiGK0pQXYxSqEHLK0I6oPJBqf2fFL1AE5lrWzV
         zXe/17TiNLdpvzmv5hsJHsFMcfmE6KWUMwn3w0dX3inQfkq3hJGs+Y02qWWIIktLp8nE
         WPyFWnn03d/TrtLtL3V5dHviJzYByIxtWvo3A71BrOsyfiseV+cMZM7tAFTXkPJMoQ2f
         b4+zAM+jaoCdpvKk7fxmFYlj+jSyvVEamhvAmymD25yT2deiZ6/v/1+CN3J7xXPrO2/P
         e1Cy9m4u39r/NPVdm3S/8Yxk/7GFETTEsRxGSBrVRSOnwXp7QMe4sycdrDpg26tSgvoy
         fynA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794384250; x=1794989050; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=e02CISDat2rnFU5auy1swbmNQ1NAggjZWxzVKQlZOt0=;
        b=YtHy69D8UBOnZ1nEsT2bCqxvjPJhPH9Q2L2I+W1rm+QAcSCg1AjoLqfJPc07jNzkwl
         ckv7n0hKbbvOkdHkTBBQMQHa2UBDF92FgnS2tAJtSZZYU16Yw853ob3pe406AxoLzvnJ
         jt9EGhgYlqcJvI0T/bqC30K1Gb/GRip49eFwxnzGb1x7FMVAmw6hcbfrxiWCyneHtA3m
         TTq7b+jHa0ZAJU74xA7h5gV4//JzXnYMYmwRGvkh4Mob/9R6S7LC2adaoMb0CQY9yeY8
         D8ut4StJcxYKbkXDg69LJ7XglvhatV16ZXiTiOMHWNomHDzI9aNRX9jK0E7bEUjn9ReC
         hmBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794384250; x=1794989050;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=e02CISDat2rnFU5auy1swbmNQ1NAggjZWxzVKQlZOt0=;
        b=A4tG7Cm84apvNOLIF7zUyTHJ7kHCvcrGan2YdWDpDp4cjNDx72uEgmDwcaCTXjHyeC
         cLmcnkAGacskKBPggL3FIVBFsC9YxX2czC4FTxvBsPVw/mgotGJK7AHGIGelZ+zmi0C2
         FkYXNZnazNP03qMMHwBiDZqeUd8j29tCwlx97duVPGnOGURbQjd/ioaFEH52XQ/zdEVJ
         +2RH728CdcDeeN+o5jJSlGarEeZVq07Ui8U89At9vCZOEy+djoH4UThCT1zhkGxlbncH
         C7tfz3/FFmu2loEjfH2HAKBZmaiu4y6ml57lq0+w6NCj0QKS7/LERGJiLZMmp9qy5GMH
         pMIQ==
X-Forwarded-Encrypted: i=1; AL+hErHG+886EbDda4JXYhHQb35cuP15shQRyPDyvuV8knrYiVIRecETh/Aq0swy1O5x5jzEbJ4=@lists.linux.dev
X-Gm-Message-State: APuU4Z8wwpgajieiSAWtqcwfnhJ/QatWLwVa7uotlFPKEIlCIWFGOqVN
	l4GEWPi57MRyX73ieHMqV/nfTy2evb7gEGPAftUxMGvgjB3VyeC7RQNyWab1nN8mpzSB4EgKC37
	XkH3Dp+cH8dmKAOCDSw8Hpcr95bL3RKM=
X-Gm-Gg: AYBFou1XYTZcxTjXUQus8IoUszWWdW3tB+NPqLNxlaCxVmm4TPUiUo2B00RTYzc5j/z
	PCrUTi5QE5eaieW8nU7aaY4cxJ0TyR2/P9lyucX1UeDKMG4SCQyzPPHuimZbejGC2iku3TDgDXT
	MvRQRG44BNGv2e4myQmjU80NZ47hSWpdd09cykj4h5Yer/1avLQySDAstVcM3BipBMHbPrA/RXT
	MJ+C9ENMX4+XAGwL++8aVZELdED4fiYF73nNVB/tooYp55WsgNr6V3PV/VT08FtEaUjKreO9GY5
	PZChTgeLdhM4kX1dALBwAB3RwFdB2EwBbD6pjPYqvW/mtBWei3IMcBsLqRvrtPm6MdpdB2hBAvD
	6BHRORqGy3K+sivGy1mooysjoabod2gq4oTL1q+iBjxJHpOQca9m+v/hXCrczfk2GNnYVGAOfFM
	8+k7RgyBCOcC8ICXduYslQTk48Jt40sQ==
X-Received: by 2002:a05:7300:561c:b0:36e:2626:4ace with SMTP id
 5a478bee46e88-3768366a866mr2441050eec.5.1794384249564; Wed, 11 Nov 2026
 00:04:09 -0800 (PST)
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261108151348.204182-1-clamor95@gmail.com> <8f84154c-0296-4c82-a887-de76558df94d@sirena.org.uk>
In-Reply-To: <8f84154c-0296-4c82-a887-de76558df94d@sirena.org.uk>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Wed, 11 Nov 2026 10:03:57 +0200
X-Gm-Features: AclHuK8vaEcJ7SqWAmNPakfkNoxiPosAOmNdZbgEthELf7kS-7VilDYNl0DIvFg
Message-ID: <CAPVz0n1LmYHJts91P4OU3WFiUBwcU6sA7Z9McOdLK6cLu6PzvQ@mail.gmail.com>
Subject: Re: [PATCH v5 0/3] leds: Add driver for MAX8907 LED cell
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>, 
	Pavel Machek <pavel@kernel.org>, Griffin Kroah-Hartman <griffin@kroah.com>, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-leds@vger.kernel.org, mfd@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=B2=D1=82, 10 =D0=BB=D0=B8=D1=81=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 21:0=
3 Mark Brown <broonie@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Sun, Nov 08, 2026 at 05:13:45PM +0200, Svyatoslav Ryhel wrote:
> > Add a small driver to control the LED cell provided by the MAX8907 PMIC=
.
> > The LED does not require any specific configuration and is folded into =
the
> > PMIC's node.
> >
> > Patch 1 of the series requires this patch:
> > ("regulator: dt-bindings: maxim,max8907: Convert to DT schema")
> > https://lore.kernel.org/lkml/20261027114634.79706-2-clamor95@gmail.com/
>
> This doesn't apply against current code, please check and resend.

It requires commit converting max8907 schema from text to yaml to be
applied first. I assume you may just ack schema adjustment and it will
be picked by Lee, but that is up to you to decide.
