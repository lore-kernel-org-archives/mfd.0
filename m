Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com [209.85.217.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0ABF6431A22
	for <mfd@lists.linux.dev>; Thu, 13 Aug 2026 06:58:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.217.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786604297; cv=pass; b=ND9SkRmyfFc7UOgfbApqtkBaXSy9uT9ZWrZFQ2eXXXFyBrHpIslbe5ZUPkGV/YkAyZsV0lMlDOvQ1ZSHoOTQ5aG38hnOuvEOOXqGkpmgbKXfXDlsVv9AwVBqhOdcS6MdiMxND2irQHqfAzkbThurXvqfp8xCxfGKqTHqnqUbeWc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786604297; c=relaxed/simple;
	bh=4bcw77KBMIYpRy8DhahSnN/xtZZNsyj77PbRJiNIjhE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KuKtqKZyLStidrSZz0QIfIJ/K+oa7opRAG3RlKgcH3GZndoGX17YM13O8WM2L9tJeTxLzyzW7LGslM5eSnN7tAVF3VDhErupbo1MnwOsgyJM2F1/186L5talkt+abdzYijCKI0s180cpB3YQfLskAwm9YdKIKFdi+2uAIZM6pVw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EXw4nDHH; arc=pass smtp.client-ip=209.85.217.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EXw4nDHH"
Received: by mail-vs1-f54.google.com with SMTP id ada2fe7eead31-745659c70ccso464605137.2
        for <mfd@lists.linux.dev>; Wed, 12 Aug 2026 23:58:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786604295; cv=none;
        d=google.com; s=arc-20260327;
        b=sjrNCYCBUw72K50fTMTOF5qjHb5JxvJKfFvlvVbm+SI6nHhPXvWYD9zDnh1ei/h36B
         LZuEMXFXy/a44CJKhnF3NYRxqxnscYu++Y5h9X2eGjMN+3vf8KoahhxUOL7cPrwQphLz
         fkdTTxCEMT+6etck4oDfUCTNHA0foBV0uG+IfIZPAObnAIf7X2B3JXOXbP0nuflEBhBe
         0odo0epoVvQEAMGTSocTXD0OjtJnKRNDR+VVyfORGEp1L1tSaRhxcZ8WRUx8RMJ86AQ2
         t90C5kzputQhomTfYJ5c/zhoUqioDmcdJE0Xp9rmyr996sEpfxUaOhb+0dTLZBmDO7dY
         QaKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=4bcw77KBMIYpRy8DhahSnN/xtZZNsyj77PbRJiNIjhE=;
        fh=JcMvLM+RIKlLYC8Ln4gihujSz3mc2xNjuyW3msPufsI=;
        b=KVrV59/kVAoivNe7OeYsJ+16U4VKWGUej4I1zxh/78yzey77YsDRjJyu+PZth5ft4M
         Xk27Po+xnOpsxpQsVTGliBwqEU02SYm3pogUK6gcWUhC8qJVXvgPaVvOvOocVnU6e59W
         CUOxBcN80i67VuEJMklttvr2Nbm313qTetxOdY6wkQ0/fFIoPqH6cjPT3f2zD2vJnm13
         u9rNGwCaFeOpzVHAyN2VQkP9VdDYyWxrKdXkoYs0bssrao7oNZYcF1ylizPmfLL6p6JN
         78C4cS4nl74bvmGwzhspSEr+Jc1a6yA7jh1OXPo57f9Yzzv9EDoz7mzzs1TEKwVGQmrj
         JCeQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786604295; x=1787209095; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4bcw77KBMIYpRy8DhahSnN/xtZZNsyj77PbRJiNIjhE=;
        b=EXw4nDHHHOCSl4iTQeJNhsWuynqDMUd4I8EMF6JaglyJ2yVgVBid+/hZBJHq8KqpBj
         bnPbw0uA8QMDgzFutWeBGq8cf3nHW4VKj8xdx8k2OoHbp1SMN15rQ4/cSf8CizYTq8Rz
         hYkaj8dghoDUj4NF9MfvV1UBrgJ5XQQcv1S7OJ28EdacfA5xPZg8/t6bL0yaUhod1pcg
         pFjdayZzRKSppVVKivQC49NKm/MNR/nmQMV2v5S4H39G457h4bNboO9zPwg65pd4Y8kN
         qyhETn4uL4gNAK4tlK+KoUg3T3VftgAdpFWZbrPGGeNJX6itv+choZ8hjd4HXzvurt0v
         juRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786604295; x=1787209095;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4bcw77KBMIYpRy8DhahSnN/xtZZNsyj77PbRJiNIjhE=;
        b=el4xno4agAUg1ZyG6Op03crqR8lIzxnkaKdHGrX0v1lM1p2GDuKucGXs5xtxgZpDu7
         1ZwhkG3jhw87ETgsEgoTpp5kAcKm0pUxlHgpxpzonzZofgnao5r3InZnauSl/PvIJyOp
         xmoX+Hm9IM7tS4x4MFOoLAScnsFPyCz51WV9XuYve/m0qYcJCRnzyyOrs1XFQtpJkvjQ
         GYdKj8X6B/VNlb8RRvBHmbZtTLswt1yItyAXo45RHJ2Rfpamt6sTU0xLEKg1yZMM33oQ
         +j7PNH8B5dWCPQ65ta8rrVchi5MvzY1T6eQBf/gqAI9lsvewvsrIIVBM9eKoSkFVrHRe
         sMqw==
X-Forwarded-Encrypted: i=1; AHgh+RomLW3Yh9WtTTtCl2Bt2D/pMKZ1oc476Co9Xt8gqqErUqAW62/MG/0Eyelu4w6esJ6dXmI=@lists.linux.dev
X-Gm-Message-State: AOJu0YzCgzt9TSIzWirYGvPDxS+bfUaPldvo3CTsIBLg5DcxL3RgXsQX
	tZGjNgNAO3kfK4Uws7+DJZuvjOh2qzDINNY8v6aevGIYVZRXVQ1d25S7ozTPKTNYIg2dhZAqrFP
	KOTI5fHHadNy76+bnXAkuBwSQvANfXBY=
X-Gm-Gg: AR+sD11fq6iwDYhKEtYSuiyceLItTtRcOnGHyAscNwCidA9WC28jM0GCoibi9lgPf+A
	QWDEPXRyoyPxc48kpvmfQ1k9pJQJzABAgpc1pDXe0D8P0iewKv32QEAE2z8qsMfUOfg8reyxzwG
	cmXyei7m2yhIMrdtkz5OhbW9L3K03/seXUzT+gSCD+SIIf8TVDcJwiX1CV+9e4AuTm0NR3Zt9l5
	cWukR9ku0y2B8OsEuAN0P2RLI0aG+2M6op01rjp8T6RxtEcbXX2nowj8NbCalNpqfSJ0f5VU2Hp
	mPZqBSD7xM0c2Y8JwHBcRgpQfymHOUwN/rOe5lxbuOL1U4qJ/XsvFhkz90uZKgHEtl4CI2xPWz7
	tmNWIS9WccqoBISsteQm8I7R9q8FlPAupmlrJQqNPba7JrPgB/lyJEPhqg+QXBMmOf0igdCI8NY
	wIpE5SR/hFr0K2j68QVJLwd/rXZGt8kR6/GFUX
X-Received: by 2002:a05:6102:c09:b0:6c3:1bcd:31dd with SMTP id
 ada2fe7eead31-76db5c7db09mr827543137.6.1786604294775; Wed, 12 Aug 2026
 23:58:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260811-submit-ac200-mfd-v7-0-8b06f552a4d7@gmail.com>
 <20260811-submit-ac200-mfd-v7-1-8b06f552a4d7@gmail.com> <20260813-independent-ladybug-of-perfection-1afe7a@quoll>
In-Reply-To: <20260813-independent-ladybug-of-perfection-1afe7a@quoll>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 13 Aug 2026 00:58:03 -0600
X-Gm-Features: AUfX_mwgvEsp_avZ39gMBtOXoVUSCDbwgKTbjWWmofYwkFQgC4t_LLBxQm2wsU8
Message-ID: <CADvTj4qaiyEtKk8bSj6Eq=q=KJ5pO90Aa0iJQrysr2LR3QuAQg@mail.gmail.com>
Subject: Re: [PATCH v7 1/2] dt-bindings: mfd: x-powers: Add AC200
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Lee Jones <lee@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Andrew Lunn <andrew@lunn.ch>, 
	"Jagielski, Jedrzej" <jedrzej.jagielski@intel.com>, Andre Przywara <andre.przywara@arm.com>, 
	Chen-Yu Tsai <wens@kernel.org>, =?UTF-8?Q?Jernej_=C5=A0krabec?= <jernej.skrabec@gmail.com>, 
	linux-sunxi@lists.linux.dev, mfd@lists.linux.dev, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 13, 2026 at 12:49=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.o=
rg> wrote:
>
> On Tue, Aug 11, 2026 at 05:11:30PM -0600, James Hilliard wrote:
> > The AC200 is an I2C-controlled mixed-signal companion IC containing
> > audio, video, RTC and Fast Ethernet PHY functions.
> >
> > Describe the parent device and its shared input clock. The Ethernet PHY
> > is represented by a PHY package on its MDIO bus, with a phandle back to
> > this device for access to the package control registers, so it does not
> > require an MFD child node. Function-specific supplies belong to their
> > consumer bindings rather than the shared parent.
>
> Other way to represent it is to put ethernet phy here - either as a
> child or folded into MFD device node - and provide phandle to MDIO bus.
> We do like this already for several devices for I2C case with "i2c-bus"
> property. Here it would be "mdio-bus" for example. Such solution feels
> more vendor-agnostic, easier to re-use, however I cannot find any actual
> arguments against your approach.

The PHY package remains on the MDIO bus because the link PHY is addressed
and accessed through MDIO on both AC200 and AC300. Only the AC200
package-control registers require the additional I2C path; AC300 exposes
its package controls through MDIO as well. Keeping the package under MDIO
therefore gives both variants the same representation, with the AC200
phandle describing only its secondary control path.

>
> Maybe Rob will have his preference, but this looks okay for me then:
>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
>
> Best regards,
> Krzysztof
>
