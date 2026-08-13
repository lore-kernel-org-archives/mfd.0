Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 588FA442B2C
	for <mfd@lists.linux.dev>; Thu, 13 Aug 2026 08:29:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786609750; cv=none; b=e6TBeUKNZoOmqh3iOm+CLW3OnJVfps5ayXOy2Pgm5m/J14AezAwZrK9+4FdCJM/GCitfu5jycQvkPuF8nXnjmPQZF5knGgMyhUxZ9JrlJCzyrtUumE9yddj2ikP4KQF/N3e6YIjIfJm4N4bgyEk2R3EN9PD3UERCz8ykMa9MYi4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786609750; c=relaxed/simple;
	bh=tZO+uk+U+keRcnrsOz15fPjhTe6BU+LORJ2iCL/GCt0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=l3wd8QGeHQfoD7TvDF5V/4xQ0bR6Yyegi/zpWXiFZNY9VZyWMMu2mKOb0qs/uTGnpy67LF+A4iviIKLysGZBN2UY2TldCWwm3vQEiz51HRG5BDjntptY3cDs2XiqauIIlhMhCwyTIVJwAZR8iZNH6Mw995yYzqZxBHBSHxfX4EQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=YSmstBUJ; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="YSmstBUJ"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-47fe89fb333so1028962f8f.3
        for <mfd@lists.linux.dev>; Thu, 13 Aug 2026 01:29:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1786609745; x=1787214545; darn=lists.linux.dev;
        h=content-type:mime-version:message-id:date:user-agent:references
         :in-reply-to:subject:cc:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=hd95siWMwoFHK3U5cEWEGYTFALaXZZqw8YjpPHhQMkM=;
        b=YSmstBUJ7Jx1AxLmmEyvbXWjVcRHS9HSgAExUoL/5F4IinBnTwiJZ8khHcaD3r4SzI
         AZJ5VRd0VQ5B6pJG387ImsGszVkKpdZ+wc6KPRM+nBzccT0xT3U3W0mrqYKaBacAmV+U
         KlZ5LwncpxsoLYGotPC7GEaRI3gLb1ck+HhDBAaSlsc5m3T0GJWq5JDuL4nhl8Z4o2pJ
         2Hv5PibjdrKB1QrXuEpTwcH9tUFNHkSxL9ZjMTxDtXJlTMHNfp7ThGTSBfqNmc8etRYL
         7CVShKhrYdpwRdI/XWF1oVv6YCl7ucLYR9K0axjXSzGLWhbCViAoWfm3U20H0ZzW6p8h
         MP9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786609745; x=1787214545;
        h=content-type:mime-version:message-id:date:user-agent:references
         :in-reply-to:subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=hd95siWMwoFHK3U5cEWEGYTFALaXZZqw8YjpPHhQMkM=;
        b=JFOx37MdcsI27UnTw8xGhN3Oi3o77jFnXq/s+ZvoII2+gE5NAZpwGfZk6b3lVsbCYw
         imVRdJGFvWdu426f8efuzGOzDKRNkV2ePwgCkQIQpeNvgMb/HZy1KOSLdpjUNoE5bJva
         UXLu0ejoDPxxANituygO04L4GrbkcOpXFKiCs7oi5tNSJUD+DUy1NkvexosEx9a4foyu
         z59oTd06uR+QHwjOd9EUxh3utd+qzJ6keTFaq8rNvIM1Abj6/ts4GWF25aUNRL0DgCZi
         f4zo49UMQQJbM0ZBcnQazaigRwdqgdJQealFSLzWjXCeQPecx5BndVtxSevdreLLTMH4
         Qh2g==
X-Forwarded-Encrypted: i=1; AHgh+Ro/kJGhI4MqGfK8Y4dNO/yNV1AafrE/6NkWyH2raESyvJmk2xu9np1hG67t+NsHXRQ19Kk=@lists.linux.dev
X-Gm-Message-State: AOJu0YwL/qykglHNWIqBeTKq0/QrDbtUAWg7uF+vU5hIwQgRloiEXIfi
	jH9C+sGRqEWf6Ee+1/vAk6TWlzniZ+wuF3Tw7SfVWiCvZYaEijH9sTDrdOPaDcNhjH4=
X-Gm-Gg: AR+sD10FZquwShSuyZ8L6/Sz0rx1+sxyRWc24HmqyCxvZyuv6knfY1HsmE8Uv/tS4ZW
	YfetAKCm8QMfzEHYQXYLxYYfHoutGnRYuSvAH4KjPMAR35It/WY/gCfZ6ddgXws/RoqXT5qH90O
	A7tpNPhSc4WkBlPlqcgu5yMyenq56ZIexlscCvgfkPNlPnsg/IFv9Jj95w4RA7F6cobXWShe/qV
	TQX+Cl+bzMZGYBXiUcZjNmzNY0O+7tqGp8H9ApVT+mHswenGl4Svexq5AA2IVGA5r69vDrhcE7x
	p3w08diV/XzEl1zHLiWnqIwfpd2C6P0ia2LDTwrnNA+A/JWy8xsBgB9X1mOAZfTjCNU1yFtZAyv
	Ws8bpOAtBObKYk2gcH9T/nqgV1E/JWV53H6qg0wV8nuZdifjxKbldQ02ge8+QddWXCtMtJuWeEo
	Crnl/hAWkQ0PHNgEhk+bJ9kdleW4PKJnVystMkqT408/tC/kgBMwpUFRngIZQnP00L+lUn9w==
X-Received: by 2002:a05:6000:41d0:b0:47f:f908:ba7b with SMTP id ffacd0b85a97d-48159feec0bmr5544710f8f.23.1786609745155;
        Thu, 13 Aug 2026 01:29:05 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:bd31:7f6f:53ba:7518])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-4815a5b6c21sm4863642f8f.27.2026.08.13.01.29.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 01:29:04 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: sashiko-bot@kernel.org, Lee Jones <lee@kernel.org>, Mark Brown
 <broonie@kernel.org>
Cc: sashiko-reviews@lists.linux.dev, robh@kernel.org, mfd@lists.linux.dev,
 conor+dt@kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH RESEND v6 4/5] mfd: axp20x: Add support for AXP318W PMIC
In-Reply-To: <20260812214019.CDF921F000E9@smtp.kernel.org>
	(sashiko-bot@kernel.org's message of "Wed, 12 Aug 2026 21:40:19
	+0000")
References: <20260812-axp318-regulator-v6-0-d6b84b55c000@baylibre.com>
	<20260812-axp318-regulator-v6-4-d6b84b55c000@baylibre.com>
	<20260812214019.CDF921F000E9@smtp.kernel.org>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Thu, 13 Aug 2026 10:29:02 +0200
Message-ID: <1jldaafmpd.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

On sam. 12 janv. 2008 at 23:40, sashiko-bot@kernel.org wrote:

> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [High] The corresponding regulator driver lacks support for `AXP318_ID`, causing the `axp20x-regulator` child device probe to fail.

Funny sashiko did not pick up on this when v6 was first sent. This is an
ordering problem. The regulator part should be applied before the mfd
one.

I could reorder here but there is not much point since the 2 changes will
land in different subsystems but it does bring a valid question:

Lee, Mark, are you OK with picking the patches indended for your
subsystem or would you prefer that I split the series, regulator on one
side, mfd on the other (with a dep on the regulator one, of course) ?

> - [Medium] The newly added `axp318_cells` array uses a hard-coded cell ID of 1 instead of using `PLATFORM_DEVID_AUTO`.
> --

... Again, already explained this in previous version and the cover letter.

>
> --- Patch [4]: [PATCH RESEND v6 4/5] mfd: axp20x: Add support for AXP318W PMIC ---
> commit 5a33005ba66225f7df0e6747b0fcb9263e977f13
> Author: Andre Przywara <andre.przywara@arm.com>
>
> mfd: axp20x: Add support for AXP318W PMIC
>
> This commit introduces MFD core and I2C support for the X-Powers AXP318W
> PMIC. It defines regmap properties, interrupt maps, and adds the regulator
> child device.
>
>> diff --git a/drivers/mfd/axp20x.c b/drivers/mfd/axp20x.c
>> index 84839d4aa1ca5..ea00c0cdce58c 100644
>> --- a/drivers/mfd/axp20x.c
>> +++ b/drivers/mfd/axp20x.c
>
> [ ... ]
>
>> @@ -1061,6 +1129,10 @@ static const struct mfd_cell axp313a_cells[] = {
>>  	MFD_CELL_RES("axp313a-pek", axp313a_pek_resources),
>>  };
>>  
>> +static const struct mfd_cell axp318_cells[] = {
>> +	MFD_CELL_BASIC("axp20x-regulator", NULL, NULL, 0, 1),
>
> [Severity: Medium]
> Should this cell use PLATFORM_DEVID_AUTO instead of a hard-coded ID of 1?
>
> Hard-coding cell IDs or mapping them to fixed instance numbers can lead to
> device naming collisions in sysfs and driver load failures if multiple PMICs
> defining the same cell name exist on the same board.
>
> [Severity: High]
> Will this child device successfully probe, or are the regulator driver
> changes missing from this patch series?
>
> When the MFD core registers the "axp20x-regulator" cell, the regulator driver's
> axp20x_regulator_probe() is invoked. It checks the axp20x->variant, but since
> AXP318_ID is not handled in the regulator driver:
>
> drivers/regulator/axp20x-regulator.c:axp20x_regulator_probe() {
>     ...
>     switch (axp20x->variant) {
>     ...
>     default:
>         dev_err(&pdev->dev, "Unsupported AXP variant: %d\n",
>             axp20x->variant);
>         return -EINVAL;
>     }
> }
>
> It appears this will fall through to the default case, print an error,
> and return -EINVAL unconditionally.
>
>> +};
>> +
>>  static const struct mfd_cell axp717_cells[] = {
>>  	MFD_CELL_NAME("axp20x-regulator"),

-- 
Jerome
