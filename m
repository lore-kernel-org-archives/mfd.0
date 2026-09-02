Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0641379ED2
	for <mfd@lists.linux.dev>; Wed,  2 Sep 2026 18:46:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788374788; cv=none; b=dRuS7q0pf3jyMkHwk7mdFN23eRylV1HVu3SWufPj5bgHab1WLFTMerM509LeEkD/6MZ6Edg4sPodDIkLK6M3G+ReWWWZRItvT4em4wWvjdH0t0EIV70I/W8RUfUdwi37kodOo/Hmlz6DfgNeiM3ISAmlQW8WOiP3ZDY6/ta6ZsE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788374788; c=relaxed/simple;
	bh=yygwotQtyWeWeoFbS6x/XaiiBa01Fa535pcusnuGMbs=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=XaZV3Glb+yhNNZpRhvOVyFp8KnijbwjJ+B2HQUdYgRlIOO5zCYOJl6MNmRp+6Cbr2t/JqtGlwCSVdFZymXf//8fcLNAu5hTIEDVUc4mXDHw/AF4FfC1yW2vFc86ZL9LlLMqYPt2hvrr41SxItVy6Zc0SyJgjiAsmBEBFFV6xC5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=mg4a0rz6; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="mg4a0rz6"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-485538d3499so1015327f8f.0
        for <mfd@lists.linux.dev>; Wed, 02 Sep 2026 11:46:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1788374785; x=1788979585; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wuAtzw2j6ol/nKID6h+TTCRJxAaTJJD8KprJBxaZGcU=;
        b=mg4a0rz6n6trsJDZW2oT5asIner3HpYwsn8ei0OjShVLkGBy2SBQuYCD1wyAoP8BY4
         TbIinIVqo4fU36V2nzdsGXC9rjypOG0H/fsl5Rhkrr1TdR9Ncd+Tykw/lvV2J8fqav0X
         zEtvoHy6asxKfqBwN85bS5F2mNETz8WnrNcGHQHi8lhkIvFI8A7q/9WTgbpnUEsAM8Nx
         i4EOgg7k8R/DwQyasL77trssgAtpnw4/JVBBEzE4njuEcY9JsvR6Il+Rrj5+SX1zbIjS
         rwBhrEIFxgdbr2S1f0xl6/Ai9uRdQLOFIrssn6CDnzYF2bbRoRWCfF+zBgsw+iUPFcIa
         ulcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788374785; x=1788979585;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :references:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wuAtzw2j6ol/nKID6h+TTCRJxAaTJJD8KprJBxaZGcU=;
        b=ctUAiJiNPRLoPlb1QnBV7coA8eNqmyAtdhpGtUhnpS5Ed/fQB0CcEXn02wYrl4GQUR
         qJnuMLMDtplEYaeUbpho+5u58uVijl8D9lDJu5fOMynWtz+YQq+AeCfcZE/5Kf1Dcmy7
         zHVh4wxYjaDU1Xb5/F1cDWuEDbApgwhdVd291Rrb8nlQdXACCwlDOXMUvkz6lldzO8Ul
         9eRtLv3WUJurpblbcZpfcf6CSBFdJIDYtr0YkBateyNNEcQnRIWLHjzeKRKmaSCnY6LE
         5uqJw8xLiCTahQ4KLiZ2ImUQF0gh+fKgUA1CyJEI99h4Fccas/mHGZnD4N40jc5yn8ft
         XTGQ==
X-Forwarded-Encrypted: i=1; AKwUvBxjPpKvKIEI1FC0cDLWfv5WrkJhewowJmNCPZEhuxNLqbdLPJWWgPliS75+UBcsEkO5+70=@lists.linux.dev
X-Gm-Message-State: AFuF++mcx9/OPpbf/vY+hiHk0F4R4OxsRl9Op/lE/vHiCD6u+TsHPb6f
	4hBmlh6G0XQI4n4mT9I4y4AmMm4ISv58jt6SG/pxHF3f1WfLoZ3M2r0HLOfMccThzuA=
X-Gm-Gg: AYBFou2NSTvzb7054tt+YXooin52LlOP78AiDPuclfMB6r5X/Gb1P7otiBvXtX23Yqr
	ROUvnPOtLkbOacKGxCRL+ffnbGS+9F2pXaUQLyTdrm3hmL9YUk3xW1cBHzPLtgt2FzrRK/IX/E1
	N9+4FqttYz9u9+JN940a7g+gPcg9STWr7Iz7sKOv8cmuQn3WhwciSAnowF7sBEgVVTgMktNlk/r
	AcSzB4CzOagvLZmz6KT6lpbvH6IpA6dygHa5m9g/icBhb7WNMLLGaFlU3eyULjS6wi27mPeEYkt
	TahTrFR2o2uPXHffELLPrVXeiOG62F+//59uNjmvOkr+gTF96sKxHnShp2ny4U5k/Ui+0LMfYXm
	Goqa/6j9ybh/yKjg8qFdd2X/mUegfHVfpsojIudgkSwGlR5UduhBQsTRhk2BdYbMeDCcr58HXCT
	CYefTY/0BzbqG+C7r/nEt/ZADekyRQSKBACOekOOfeU3E9JreVuVKlWMpZGnL19tovKxDhxwGZV
	656VGk=
X-Received: by 2002:a05:6000:240c:b0:484:4817:85db with SMTP id ffacd0b85a97d-48488f10241mr11800333f8f.14.1788374785193;
        Wed, 02 Sep 2026 11:46:25 -0700 (PDT)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48448eea961sm8160630f8f.28.2026.09.02.11.46.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 11:46:24 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: wens@kernel.org
Cc: Andre Przywara <andre.przywara@arm.com>, Lee Jones <lee@kernel.org>, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark
 Brown <broonie@kernel.org>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, mfd@lists.linux.dev
Subject: Re: [PATCH RESEND v6 4/5] mfd: axp20x: Add support for AXP318W PMIC
In-Reply-To: <CAGb2v66Uz6hCQaf5Nk5Eup8wQ+Xo9tuAqm0+ZH9J5CbT0zyAPg@mail.gmail.com>
References: <20260812-axp318-regulator-v6-0-d6b84b55c000@baylibre.com>
 <20260812-axp318-regulator-v6-4-d6b84b55c000@baylibre.com>
 <CAGb2v66Uz6hCQaf5Nk5Eup8wQ+Xo9tuAqm0+ZH9J5CbT0zyAPg@mail.gmail.com>
Date: Wed, 02 Sep 2026 20:46:23 +0200
Message-ID: <1jjyp38pa8.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On dim. 23 ao=C3=BBt 2026 at 21:17, Chen-Yu Tsai <wens@kernel.org> wrote:

>>
>> +enum axp318_irqs {
>> +       AXP318_IRQ_DCDC1_V_LOW,
>> +       AXP318_IRQ_DCDC2_V_LOW,
>> +       AXP318_IRQ_DCDC3_V_LOW,
>> +       AXP318_IRQ_DCDC4_V_LOW,
>> +       AXP318_IRQ_DCDC5_V_LOW,
>> +       AXP318_IRQ_DCDC6_V_LOW,
>> +       AXP318_IRQ_DCDC7_V_LOW,
>> +       AXP318_IRQ_DCDC8_V_LOW,
>> +       AXP318_IRQ_DCDC9_V_LOW,
>> +       AXP318_IRQ_DIE_TEMP_HIGH_LV1,
>> +       AXP318_IRQ_DIE_TEMP_HIGH_LV2,
>
>> +       AXP318_IRQ_PEK_SHORT,
>> +       AXP318_IRQ_PEK_LONG,
>
> The order of these two are reversed.
>
>> +       AXP318_IRQ_PEK_FAL_EDGE,
>> +       AXP318_IRQ_PEK_RIS_EDGE,
>
> And these two as well.

Applied everything except this is last one.
AFAICT, the IRQ above are not inverted ... but it is slightly confusing
because the regmap_irqs orders it the other way

Thanks for the detailed review=20

>
> Once all these are fixed,
> Reviewed-by: Chen-Yu Tsai <wens@kernel.org>
>
>
> ChenYu
>
>> +       AXP318_IRQ_GPIO1_INPUT =3D 20,
>> +       AXP318_IRQ_GPIO2_INPUT,
>> +       AXP318_IRQ_GPIO3_INPUT,
>> +       AXP318_IRQ_WDOG_EXPIRE =3D 24,
>> +};
>> +
>>  enum axp717_irqs {
>>         AXP717_IRQ_VBUS_FAULT,
>>         AXP717_IRQ_VBUS_OVER_V,
>>
>> --
>> 2.47.3
>>

--=20
Jerome
