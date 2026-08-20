Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DF7447D443
	for <mfd@lists.linux.dev>; Thu, 20 Aug 2026 16:23:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787243011; cv=pass; b=Ck39qejJ771VtEXdN68v0wRzniAYbzGUbz9gX98R3AFCdCbL34LN05Vyh1dZOVfgok85m+I7YeGl00l2cNC05NbRm3jqrAjFqzIkOA9bocEFth8i8pnPq/VsqDwEqt8qzrMUJAZkNsMlEWGOVY1AImXk0xX5BOipE/TSeH8JtDQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787243011; c=relaxed/simple;
	bh=nM7522pMTSm6ohXpjcirSMLxO2bUSl44i0fllcYRFAk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DoHi53YAHvmia9iICxLzsEXg+vs2XjQZr8CnQmQqS9iLk+0pk+MNosakF7PHobHBM9NoHfzvbMrxW5Ry4wMRWqfU3+k374uOv3peaYk78ETgs/os1yY6cHKeBImhBLz7ViOyHkaSKY2PUYQbsN3wKEP5Q9f2j44BjSqLHdWZDM4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=n5aUL5H3; arc=pass smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="n5aUL5H3"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-c15d111ca99so2764566b.0
        for <mfd@lists.linux.dev>; Thu, 20 Aug 2026 09:23:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787243008; cv=none;
        d=google.com; s=arc-20260327;
        b=W9IyNzx/zEmZpGxZcc4GJtaGYqxc6ezEDcWmEdrbpm/lZZZldJ4DdFRCjHJvbAr9qA
         oBxa1mpSy5CU9imBRW9BCpWm8C1XwhNCxQN/7lm9i0nx0X8vW/JofjFrqbdJmmI9iBMq
         vKvZwULAepbrYMtlapJ4qNX9XuEA8BVJn8F72eT7TGbVjTkTjGVA7/YgXsvxXaPI0/l2
         vbCg4hYkOpYc9Sma9S5qyYuInL+ale9ICjG+NukN5P7U7wyEoYugDhlf1LPaSjVTE6h9
         c77iKhFmwZqO9i4Fg1I8+TYWXk2dXoY5dgNHnvyrsygG8lkQdN7UzbKKT7Zs4rbkK22Q
         CDxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=yKhR9WkhIUiBs/DXzAMG9ly3j13B+5WjNx96hhgAatQ=;
        fh=la+xwWJI6omzW4cRsyIpY2AjRfbsoO/ZbhKmRA8nhkg=;
        b=svizZKdkVKBEbZHaMYA1/8e1nyY3S6x0Y3xrpCLOAY+e3jsR1wJWlvWYf9wBBsFRkh
         uDZPZBKFjjpYkldAfANuWwUso2aoscjVYyhiS34chskEdO2z5MOSuYmy1ONXqGNk351b
         krfVpM83Oa3DpvQ8YHVYFyjBq7pAYYfXWOCUfmCWHPNyewf7HYaF7R+PFyKJI5lEBBVU
         66Ha37VS1qrAPDC8RiIW3tFFkRS+Wx4WAw29kc6qgKN4Zt/nlmCqCjeWLIl2GzecJJtq
         gKZVSi/tP3ch77P7Tfndr0UNbgx/eyJ6wOrebocdw/BLHMZlBrRG21u8yEQl7ooIl9H5
         LidQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787243008; x=1787847808; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yKhR9WkhIUiBs/DXzAMG9ly3j13B+5WjNx96hhgAatQ=;
        b=n5aUL5H3wNkR3xw0ImkkwoXH7dkTBY4aqsmtv4PBxeB8Gd6yLN6cGBJ4fd9Sgvb3I1
         QRojbW87HJoDbERUAg/dwcejYVpqzbLq3aMXujZHoXd47QZfKQELk+nn1KxtfnoLw0fx
         9p8caAZgeN692Q9MuoapQZ62oD0BolQiI/pqKz140+t9AvKUvHLI17tvtXQN5PXl3Wu6
         Fh+X6oQOWfW/+INh+D0pVScDiZJk1H/2kFTrI8PVUMSAu76XD8x2TeEvM78YeBPya9pc
         ioOP9PwcUO/rBRfRTpfhk077caOyuGje/w6SaGu/LblPpDGm2y2r4xs+4aykwDsDBYY5
         hcmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787243008; x=1787847808;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=yKhR9WkhIUiBs/DXzAMG9ly3j13B+5WjNx96hhgAatQ=;
        b=fXKXC+Qe9p83h4FMrPl8Rhae/bkuhLG4rWC/+S59yspjeXV/YY1eASG/LOmcMQZogY
         usk2WnMR4whUjUZnDYpc4N8mTcf6Tw5R11hZUZVrFybUrGJ0pyBxMi+10Hg1GLS/rPYl
         Rn0WqLqqpAoDOVPZ6AdVdgGUGAiQWL1MOH/nH6dkMW+VautQ0rsqFm7THe8J3QMfwi24
         J5YbjCK5TYHR5Of6xjycaK9vVkdO7jOJHSh7PczF1FpA5UJyOqpIsDoKx/6OhIzlQhi+
         oHrn3D0/ADUIrddPpnD+1kTNjZi4rH1kftrRDCQeXmzuwGbLSnk/mBoUF8YjpVKGUKvI
         nwGg==
X-Forwarded-Encrypted: i=1; AHgh+RpG9iAhZYCl1yTCv50gDm0f5RtJx6hnGA98PKO9MmZoVogW3/m1K0X9PYxSFqJXTNdMz9A=@lists.linux.dev
X-Gm-Message-State: AOJu0Yzi6skqL94ktiS4WYFE3234pkRcRQNv4pqEoHxRdT60nOrsg3dk
	k/C1OGQ9ExmwEcvH1caI9q6dUJ3pNSFJsYsakj3Cy9Sfk2wgY5xcrNDI+RvBirp3qtrWvsXqTPC
	BE7PfamG5Vx4S6qn2zGM32gZHWVfc81k=
X-Gm-Gg: AR+sD11ISa3XLi7cMEaV0yCBT0tJV/hDKQkBTRdM4nt7vSzK5384PVxaobEXV/egk/w
	ipVgw4SfZtfZYYsaEaUlAyMJDPLAmwrqqbqMeb0+9i7viuHn7mE2X/1WSbTiSacli1pZGNNJ8Ni
	bVRxWJqxX25ohxlk+12gdTV17piG/uMS/BtB89FPvMyNkqzO5nIUEvdRzQm8WPYmuojed7WbtNR
	Ty5zZUzJ3km+9hBkV556Kcl4/cGw5Pyw8pmc+fhDLZ5rOPfXvDqWLvJyaZJcxJy3JNL4zI4lOwb
	tYoTbDyeQ2aLxVq0XgNkd3ub+hnSQ+lApeoVr4ciJgU=
X-Received: by 2002:a17:907:a647:b0:c12:9b93:61fd with SMTP id
 a640c23a62f3a-c23e86dd23fmr1141726266b.6.1787243007488; Thu, 20 Aug 2026
 09:23:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260820122242.120039-1-l.scorcia@gmail.com> <20260820122242.120039-2-l.scorcia@gmail.com>
In-Reply-To: <20260820122242.120039-2-l.scorcia@gmail.com>
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Date: Thu, 20 Aug 2026 18:23:16 +0200
X-Gm-Features: AcwNN1WN15gIPFE-wS5GMikP40k9b6tUzSd1TSg8R6uNQUbH06o6RfXy9sJzOY8
Message-ID: <CAORyz2Lgo=teK89gxm6QBMfREY=_cAFN2TuLUFvwGcYpozkWww@mail.gmail.com>
Subject: Re: [PATCH v9 1/9] dt-bindings: mfd: mt6397: Add MT6392 PMIC
To: linux-mediatek@lists.infradead.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Sen Chu <sen.chu@mediatek.com>, 
	Sean Wang <sean.wang@mediatek.com>, Macpaul Lin <macpaul.lin@mediatek.com>, 
	Lee Jones <lee@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Linus Walleij <linusw@kernel.org>, Val Packett <val@packett.cool>, 
	Julien Massot <julien.massot@collabora.com>, Fabien Parent <parent.f@gmail.com>, 
	Akari Tsuyukusa <akkun11.open@gmail.com>, Chen Zhong <chen.zhong@mediatek.com>, 
	linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, mfd@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> --- a/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml
> +++ b/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml
> @@ -40,6 +40,10 @@ properties:
>            - mediatek,mt6397
> +      - items:
> +          - enum:
> +              - mediatek,mt6392
> +          - const: mediatek,mt6323
>        - items:

Please disregard this patch/series. Sashiko correctly pointed out that
it's not necessary and actually wrong to provide a fallback on
"mediatek,mt6323", which was needed on a previous iteration of the
series but not in the current one.
I will mark the series as archived on patchwork and provide a revised
v10 once completed testing on devices.
-- 
Luca Leonardo Scorcia
l.scorcia@gmail.com
