Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2041337699
	for <mfd@lists.linux.dev>; Mon, 10 Aug 2026 05:47:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786340863; cv=none; b=DjoBMt95KysbJq4U+w21vHGxpLqa2gRjkBZb/4p39ksX+E5bB7no/YA2vt0F6wg8dlMGfDsQkal+vJpvkdVjOhq44SxeTHzMaaUvJxEGjl/g1aB6zC5R17iEk2SmGX5VgyiQbakpR9SB7PNyRB6S6IvPbeBRcgkvudASGO9AtOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786340863; c=relaxed/simple;
	bh=AWMJoce7pnftoApbVh15TcpMiuMZ1v3TsqwFuMUo2h8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=R/4c2GTYd3BDeoGyXJc+mTlp73QtftIP/3B3yRylTfr3uPhiSWA+8w4F+wRReUpQDB/oJ4e5UiQkYZYjFAJY7HIUPPZFgJIOnqxreRE8ulQFmghZfgozDxrNaNxdSHbpPesFRD8nin9pLPyTiPs3j4fJMSCLBGp22Mp8djqYO1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B3TePh3x; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B3TePh3x"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5b0231a3e86so1368757e87.0
        for <mfd@lists.linux.dev>; Sun, 09 Aug 2026 22:47:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786340860; x=1786945660; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oUFfp1/cNFOhAWdi1g6pduhZx20pCKXkmLPmJPcXpEc=;
        b=B3TePh3xBy9VZSk1Il9NCa1e3aalLRx/lINLlQ9HKdZx0cWWqqb8GVdtUknFICct8b
         xJM6GlSshIFPqt/NpCTtRqIjUPtNAOBetckyrDFCmq92SqPIY3wxUS2M+APNY5vg/9OT
         1fTmdw16v8PVde0eVpoHlayupuCVvcACck8RY1xUHXVkZw1OLYF93OBGDwjEhBlJFQkp
         0VEjz6ShllaYPIlChL8KhB18fkT/dnORK2jM8ftudDA+/Mra9+sGEJ7DtAic6ORIFJmi
         0y+LXBqMFjmbRvgvYLUwKN8yyUJlrv27eBLrBkq7EGoyL/vGx1g3vs5eku8dpUxc5JdM
         2CXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786340860; x=1786945660;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oUFfp1/cNFOhAWdi1g6pduhZx20pCKXkmLPmJPcXpEc=;
        b=S+1vypesnKmo3m//gOGhDNasdbYLa2JR+Nu2m2K+EpUpTO2MZ3TF12eAs0fmSLy4pf
         6tKdo6YApXOkEezm7YqdbMNUxNPcArkSJi99B9u2xV5Yj7lDEnsJiEInjVadBIuOmEOh
         495I6TLXGwSX4paP5wrffMGbWGOg3j6pKQCOCNCjpsxVG7mmlY7kpSGJznIa21tt381I
         vVszOxGlkQMUvAMP0T+jTxhIQHnZa/x+V9/5+Gd+bI6FtyVIokB38RqetzMy6tZizbF4
         O7Jr68dBNDcgjyH12Ireu0lw7YxaCNj4ejyIClg0cFozlTMcrlOWY7pc5t6VL3GXZtLN
         +Jfg==
X-Forwarded-Encrypted: i=1; AHgh+RrafaK4MZIdzLftJraw//KkbWFqgh7HvPn8NyEExxXGI8ZAZ01nRSAuxoPy3gTUBpIBMI0=@lists.linux.dev
X-Gm-Message-State: AOJu0YydiQIBhQ2sTzoGW+EIk8r5T59wXTSjbvR7v8DxELD5pQTcH/fQ
	07+9mLmXZw6KOweKW1k8Yrhz9O4JV++X/MF9mkoEyEiCHdePKyMk0I74
X-Gm-Gg: AR+sD120lQslok9NeePhPS0Yw/o2Y9HkdXMmpjgH4jiKPGTQABZzUCTBzhfeXaKj00L
	S8YfL3RQuuaf4ShyzLAELA/5wdm87EEqujjKV48nr/h+ITlsJo+0ythiHH88jPtDFB8J/Cs3GNx
	3/A8UmzRbeGHhA6J44HPwLBFZvztzzHjNY2zLVqso/+NABqwZYu/FMbp6uK3PShskN3ljG4GyVy
	EuWM+aL0BqXxBAkcIOA5NcOpqhqMG3aFsc7V7Nj+2D9tE+Usgd0NwrSM0QnRrWHw1N7ZkO2DTZd
	nz4aq7J2T/gLk9fH03DIKY2BCMftCeudVguxUgO3V0Fg/7FazbRsnDfRiZwCR/zHI3Ng70+BL3u
	ARMhuWTwUUJ1K+dSIGjgALTbvIq2HKfA9XUVmEzcdS8qq3NjTRLkUEu7WTmqxYWh9gHwpZs01lF
	2Mk06RVkNJ9GJm6115ukjcJHWnNXqyuP932L4U1ZYCTO8523bvWu43NkpScG5MJJeo7NMFk6HBl
	26eHPEGtDjmqEt9GaplX4CdyLxuiAhkHtes7BBZyLp6bHV1sYtoTcAFOhYiBXF5vhMR
X-Received: by 2002:a05:6512:638c:10b0:5b2:b004:ab9d with SMTP id 2adb3069b0e04-5b30b770fb0mr1599566e87.34.1786340859873;
        Sun, 09 Aug 2026 22:47:39 -0700 (PDT)
Received: from ?IPV6:2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703? ([2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39fdda988bcsm19527201fa.14.2026.08.09.22.47.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 09 Aug 2026 22:47:39 -0700 (PDT)
Message-ID: <8af920f3-d856-43a5-9485-f4d39cc7fcb7@gmail.com>
Date: Mon, 10 Aug 2026 08:47:38 +0300
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 09/10] gpio: bd73800: Support ROHM BD73800 PMIC GPIOs
To: Linus Walleij <linusw@kernel.org>
Cc: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
 Matti Vaittinen <matti.vaittinen@linux.dev>, Lee Jones <lee@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Michael Turquette
 <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
 Brian Masney <bmasney@redhat.com>, Bartosz Golaszewski <brgl@kernel.org>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>, mfd@lists.linux.dev,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-rtc@vger.kernel.org
References: <cover.1785838584.git.mazziesaccount@gmail.com>
 <9774b8d6663ea55b1682b32f825ec5689be3e1d8.1785838585.git.mazziesaccount@gmail.com>
 <CAD++jLmatJFfqhNWfgx=qUW2fEwuatxmJR7NyJLAv45LfLHZnw@mail.gmail.com>
Content-Language: en-US, en-AU, en-GB, en-BW
From: Matti Vaittinen <mazziesaccount@gmail.com>
In-Reply-To: <CAD++jLmatJFfqhNWfgx=qUW2fEwuatxmJR7NyJLAv45LfLHZnw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 07/08/2026 23:29, Linus Walleij wrote:
> Hi Matti,
> 
> thanks for your patch!
> 
> On Tue, Aug 4, 2026 at 12:23 PM Matti Vaittinen
> <matti.vaittinen@linux.dev> wrote:
> 
> 
>> +static int bd73800gpio_get(struct gpio_chip *chip, unsigned int offset)
>> +{
>> +       struct bd73800_gpio *data = gpiochip_get_data(chip);
>> +       struct bd73800_gpio_pin_cfg *pin = &data->pin[offset];
>> +       int ret, val;
>> +
>> +       /* Only pins configured as GPI via OTP can have their status read */
>> +       if (pin->state != BD73800_PIN_GPI) {
>> +               dev_dbg(data->dev, "pin %d (%x) not input. State %d\n", offset,
>> +                       pin->mask, pin->state);
>> +               return -EINVAL;
>> +       }
>> +
>> +       ret = regmap_read(data->regmap, BD73800_REG_INT_5_SRC, &val);
>> +       if (ret)
>> +               return ret;
>> +
>> +       return val & pin->mask;
>> +}
>> +
>> +static int bd73800gpo_set(struct gpio_chip *chip, unsigned int offset,
>> +                         int value)
>> +{
>> +       struct bd73800_gpio *data = gpiochip_get_data(chip);
>> +       struct bd73800_gpio_pin_cfg *pin = &data->pin[offset];
>> +
>> +       if (pin->state != BD73800_PIN_GPO) {
>> +               dev_dbg(data->dev, "pin %d (%d) not output. State %d\n",
>> +                       offset, pin->mask, pin->state);
>> +
>> +               return -EINVAL;
>> +       }
>> +
>> +       if (value)
>> +               return regmap_set_bits(data->regmap, BD73800_REG_GPO_OUT,
>> +                                      pin->mask);
>> +
>> +       return regmap_clear_bits(data->regmap, BD73800_REG_GPO_OUT, pin->mask);
>> +}
> 
> These can probably be handled by the latest version of gpio-regmap
> helpers (the version in linux-next).
> 
> We now support both input-only and output-only in gpio-regmap.

Allright, I'll take a look at the gpio-regmap again. Thanks for letting 
me know ...

> 
> Latest <linux/gpio/regmap.h>:
> 
>   * @fixed_direction_mask:
>   *                      (Optional) Bitmap representing the GPIO lines that
>   *                      make use of the @fixed_direction_output list to
>   *                      enforce direction of the GPIO. If this is NULL
>   *                      and @fixed_direction_output is defined, ALL GPIOs
>   *                      are assumed to be fixed direction (out or in).
>   * @fixed_direction_output:
>   *                      (Optional) Bitmap representing the fixed direction of
>   *                      the GPIO lines. Useful when there are GPIO lines with a
>   *                      fixed direction mixed together in the same register.
> 
> It seems you can set up the fixed_direction_output mask from OTP
> and just use the library, right?

... and thanks for going the extra mile and giving me this pointer. 
Helps a lot! :) I wish all reviewers had the time to give this specific 
suggestions - although, I understand this is not always feasible with 
the amount of reviews/tasks to handle.

Yours,
	-- Matti

-- 
Matti Vaittinen
Linux kernel developer at ROHM Semiconductors
Oulu Finland

~~ When things go utterly wrong vim users can always type :help! ~~
