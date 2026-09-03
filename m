Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FDF6377EDC
	for <mfd@lists.linux.dev>; Thu,  3 Sep 2026 05:00:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788411632; cv=none; b=IsHAO/74Dezspwf3v4wvgHHZVMm0LMfeXK1xNzCVxhSPN8hGUivkvoSysATJuIE2u/v5Xh/Ies19mTFgGdhzQeDcSPUjbLTAW2jzqxrF9kYWhLUZYFXPuS3fU8oJmUL1NPIVmIj7F0qVVAqXPRYDB7QAJ2q8sS+px1fVo6hnOnw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788411632; c=relaxed/simple;
	bh=Do6DIyYheb72ubQenuc39X/h+3c0RITXfqxUusCBwQ0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fVst6JiYK3Yi7Qrmm0D9rNYOwYtSfL4txsE2PdUnJ2d3kJFm3+lNP5h8zKgfCO77IUYRrZFY210bt5gtd1UCCmBoTkN2E4+y5ePuX6kMeUPGjbBgmtGht42mJJnBjyUqp+i+c8cbpUS2VXNvSb5Ayoo9y5DNVyRlGxBWd/+Z9og=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nrA2uuyp; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nrA2uuyp"
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5aeb98460c6so2918843e87.2
        for <mfd@lists.linux.dev>; Wed, 02 Sep 2026 22:00:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788411629; x=1789016429; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Aw9gpVGru8xiZcUq3dSpmW3TOUrgw1owBT+0w2fdvGo=;
        b=nrA2uuyprA38KQdbWPtQr92ftDmVQN1I+pu5IK+bFxoKJiQQps41dDGmM29nkAP4Qj
         6JkIdB3iOcWQypg57H5X8SI3/qc96s759OC4rUrMUrvjnqfSEfGrIXiLlYjh8wAJ6uFE
         9tqT9GAARjQKpNtkQZFi6Dak4Axs8ZWyOaXTCC1QzNcRkh1bpR9UOHXwxlDUfX/34I72
         ht4VxLKSR03c0GGtOfkaJoBYPkFMW8pOXXLq55lafauR++WTMFsY2rXQtKcjHjZ7G/xd
         h89vnwc2U7wxTOjipmgwFCABXdfP/WPwv69y+fjxC+ED7Adlbs688IyvHQjYVe4+NKUR
         GuHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788411629; x=1789016429;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Aw9gpVGru8xiZcUq3dSpmW3TOUrgw1owBT+0w2fdvGo=;
        b=MLv/mT+5BrsvSKVT73hINqCBnPRiOpe0qWeTiz7rZk8McqslMk0lwGnj1fA0AaijE8
         0VLF8jtiM44iQYnnL7h/yWDi8QRVYqQfUBBkAwKI5LNjuw4dhX2LsaUKGg4GA5NfKoc1
         irUS9Ek87dbQi1qSDkWxWQCZCUG0SWKcPMtfD+MgJQrnHeTN3z1SpR1papCHPkbdSRrq
         DGOM8PLSc7RhotrDH1Y6LpIdTbcfncQzojjlzqEVuM4aehM+lxMJ8kOMBl1ebxD/YsVv
         a9SS60f7UmXiVwUK2Zrua92fQdjbLz8iEJhxHyg28nn+PrKu52OlQqFx9HRleGJ0nLke
         arjQ==
X-Forwarded-Encrypted: i=1; AKwUvByNMiG8ulCcrZfYY5dhdxwn68nQfxXzt/TUUXwWBV5dTshM5kpLk9jqYS1+k91PcHNY81w=@lists.linux.dev
X-Gm-Message-State: AFuF++nJwWw91OgzBXbmi2ItPBC2aHyywAmG7WcZ4aEzTCMNoWr0Mo7g
	HTgpHm3MFaldzqMTbqbub7oo8nuj3Rau0MrqmUcNTgkwD5Axp/hCiRTY
X-Gm-Gg: AYBFou2VzvK7A4/1az1pHeOIq/r3paqtSG4hnsrMCvDeJSbi9o8x5PnuaGxNuJh7aVS
	JOxazZIMxygeDjETd8V+AdwU5xLVfgXR4Bm4UXNo7DdZERok3SoNN5FH1Db3XV6kuPJFFSDbtqZ
	krYjKRMb83+17dyfgG3QsgchuvYl3aCRuXD9wNM12mnQ7hcAq8taDrbJ+y/D5/H4ISqscgD+gM8
	HmIHdfxl9/Khq1+jKtu1dzvbq8zN41bli3/IFYCijIPrWlaI+O8OFV8MyC3/p2QAxR9WZb1uzSQ
	wLbwTDzu0kbw9a+AjwJ+jkSzdK0ofC/4Tpm/Dr/t0M7RKGlMrOWSe00Csio625YWvxyuLKleOwu
	3ITqQ1kr0PFYvSn9ChpeAoY3Z2qqUncSiGK4CJZKcryEgrAf6m/4V/NwOOIF4nsyoIYkVkl1q1P
	nS0aOh4gA56G4CP9Y608avPWyl1q7IgEkaGar02Xb4UTthya2p8CBI2iYyJWuo7PK/YyUb411Eo
	B+nz4WHYoSXlwq5inu2AvXkZs0EB6L64C8kRGLgr7UH
X-Received: by 2002:ac2:5685:0:b0:5b5:e393:2284 with SMTP id 2adb3069b0e04-5b60832fcfemr3051273e87.3.1788411628714;
        Wed, 02 Sep 2026 22:00:28 -0700 (PDT)
Received: from ?IPV6:2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703? ([2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a350e4caacsm7622581fa.21.2026.09.02.22.00.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Sep 2026 22:00:26 -0700 (PDT)
Message-ID: <57832670-6066-424d-a75f-4eb1f1f0cf73@gmail.com>
Date: Thu, 3 Sep 2026 08:00:24 +0300
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 09/10] gpio: bd73800: Support ROHM BD73800 PMIC GPIOs
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Matti Vaittinen <matti.vaittinen@linux.dev>, Lee Jones <lee@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
 Brian Masney <bmasney+clk@redhat.com>,
 Jerome Brunet <jbrunet+clk@baylibre.com>, Linus Walleij <linusw@kernel.org>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Michael Walle <mwalle@kernel.org>, mfd@lists.linux.dev,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-rtc@vger.kernel.org,
 Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
References: <cover.1788346553.git.mazziesaccount@gmail.com>
 <5eb294e68b8d5d2c1d3a12b14a55dd2a9c075a09.1788346553.git.mazziesaccount@gmail.com>
 <CAMRc=MchpaOib+jgMniG7=BBYwB1yqLvJG1sMkjXfRaMFPodgA@mail.gmail.com>
Content-Language: en-US, en-AU, en-GB, en-BW
From: Matti Vaittinen <mazziesaccount@gmail.com>
In-Reply-To: <CAMRc=MchpaOib+jgMniG7=BBYwB1yqLvJG1sMkjXfRaMFPodgA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi dee Ho Bartosz,

Thanks for the reviews!

On 02/09/2026 15:58, Bartosz Golaszewski wrote:
> On Wed, 2 Sep 2026 13:07:32 +0200, Matti Vaittinen
> <matti.vaittinen@linux.dev> said:
>> From: Matti Vaittinen <mazziesaccount@gmail.com>
>>
>> The ROHM BD73800 PMIC has 4 pins (named GPIO1, CLKOUT, FAULT_B and
>> EXTEN_OUT) which might have been set to operate as a GPI or GPO when OTP
>> (One Time Programmable memory) is written at device manufacturing.
>> Support the GPI/GPO use-case via GPIO framework.
>>
>> The default OTP for these pins is to not use any of them as GPI or GPO.
>> (The GPIO1 defaults as an ADC input regardless the naming). Hence the
>> driver assumes none of these pins is a GPI/GPO unless explicitly pointed
>> as GPI or GPO via device tree.
>>
>> Furthermore, pin's direction can't be changed after OTP configuration is
>> done. Also the default drive type for a GPO (CMOS / Open Drain) is set
>> by the OTP configuration. The BD73800 has a set of undocumented test
>> registers which should allow changing the drive type. Access to the test
>> register area or the test registers aren't documented and so this driver
>> does not support configuring the drive type even though it might be
>> doable.
>>
>> Signed-off-by: Matti Vaittinen <mazziesaccount@gmail.com>
>>

//snip

>> +
>> +static const char * const bd73800_gpio_properties[BD73800_GPIO_MAX_PINS] = {
>> +	"rohm,pin-gpio1", "rohm,pin-clkout", "rohm,pin-fault_b", "rohm,pin-exten"
> 
> Can you put the properties on separate lines?

Sure, no problem, thanks. I just wonder if I should re-spin the whole 
series for this. I suppose I'll wait until the next week, to see if I'll 
get any other comments.
>> +};
>> +

//snip

>> +
>> +static int gpo_bd73800_probe(struct platform_device *pdev)
>> +{
>> +	struct gpio_regmap_config config = { };
>> +	struct bd73800_gpio *data;
>> +	struct device *parent, *dev;
>> +	struct gpio_regmap *gpio;
>> +	int ret;
>> +
>> +	dev = &pdev->dev;
>> +	/* The device-tree and regmap come from MFD => use parent for that */
>> +	parent = dev->parent;
>> +
>> +	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
>> +	if (!data)
>> +		return -ENOMEM;
>> +
>> +	data->dev = dev;
>> +	data->regmap = dev_get_regmap(parent, NULL);
>> +	if (!data->regmap)
>> +		return dev_err_probe(dev, -ENODEV, "no parent regmap\n");
>> +
>> +	ret = bd73800_gpio_get_pins(data);
>> +	if (ret)
>> +		return ret;
>> +
>> +	if (bitmap_empty(data->valid_mask, BD73800_GPIO_MAX_PINS)) {
>> +		/*
>> +		 * The BD73800 may or may not have pins allocated for GPIO
>> +		 * depending on the OTP used at manufacturing.
>> +		 * If there are no pins, then we have nothing to do.
>> +		 */
>> +		dev_dbg(dev, "no GPIO pins\n");
>> +		return -ENODEV;
>> +	}
>> +
>> +	config.parent = parent;
>> +	config.regmap = data->regmap;
>> +	config.label = "bd73800";
>> +	config.ngpio = BD73800_GPIO_MAX_PINS;
>> +	config.reg_dat_base = BD73800_REG_INT_5_SRC;
>> +	config.reg_set_base = BD73800_REG_GPO_OUT;
>> +	config.reg_mask_xlate = bd73800_gpio_reg_mask_xlate;
>> +	config.init_valid_mask = bd73800_gpio_init_valid_mask;
>> +	/* All pins that are valid GPIO lines also have a fixed direction */
>> +	config.fixed_direction_mask = data->valid_mask;
>> +	config.fixed_direction_output = data->output_mask;
>> +	config.drvdata = data;
>> +
>> +	gpio = devm_gpio_regmap_register(dev, &config);
>> +
>> +	return PTR_ERR_OR_ZERO(gpio);
> 
> Why not return PTR_ERR_OR_ZERO(devm_gpio_regmap_register())?

How strongly do you feel about it? It's not a big deal, but I always 
find it a bit harder to read when functions / macros are called inside a 
parameter list. Thus I'd rather keep it like this, just for the sake of 
my own eyes :)

>> +}
>> +

> 
> With that:
> 
> Acked-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

Yours,
	-- Matti

-- 
Matti Vaittinen
Linux kernel developer at ROHM Semiconductors
Oulu Finland

~~ When things go utterly wrong vim users can always type :help! ~~
