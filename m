Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 248E839656C
	for <mfd@lists.linux.dev>; Thu, 13 Aug 2026 08:34:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786610065; cv=none; b=q4ARdQnhbNwC9cfwP6LN17+RUQhRS7Bfp4cKHY7NGo2OQ1BBcKJ5OBqmgy9V5unZ2HYuEWbJK4hnvtEOi+ytgAmuCdhETp9LzSEV3qiUEycutn5BHCDB5QbpKCajLqw1NNE29vVhWWCYBT8mhr8mKdikIMg/r9LLscidd48tEF4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786610065; c=relaxed/simple;
	bh=Et8yr7T4XI2QiD9tHPH6gogO1W8MVDfDmWwZXyvssoM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iQ9R93oqHFgiHXUr8eeYdbAUItAGkqB5GSNLuCIK54QmzE7Nw69sXYhbsSzle1NC5kUUExJiDd6fcsXeZjwtH1kDnN6Byldu/Y57ZQLApg71Esw0rjQZFs4J4Kzgl6QL9eZf5nE8xo5sy26iHyCgmoGswgDdPtIpyuuYWwi2as8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oiyPLpe7; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oiyPLpe7"
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-3a115c08b0bso8838931fa.0
        for <mfd@lists.linux.dev>; Thu, 13 Aug 2026 01:34:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786610061; x=1787214861; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mUlqoelOp41/qPHMuXnll43fbi7+sd/XaTpVYDwo8o4=;
        b=oiyPLpe7qGgHCAq9MTdtKtyQUHqkgdtMLqj2O765oLQDhu7o53swF0cOLLRYkXPOrS
         zmr7+pEu1ZqSHwEeAHV3CDEj5umHwKRWazuCAjmtmmO3kW2RCYDbTHcpPYVagccW16KS
         wjBWg9RR/0Jfhfs4EV1Sud3xx8WHzOAVJnaygs1WeweUfjA3Wl22rjxyb0nAG/jK7fds
         NDh8OFcKqdayPrriI12TToPTSHL/JMStxe45XT3goM39e+V8FOX/rZrGi7sB8CaKBHaJ
         07OdCPtP8WsBX7p6XFWblU9/X79o46sTZBjqs7UeaHZENMaugHOBM2sXILpa0LzcT8qC
         dfhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786610061; x=1787214861;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mUlqoelOp41/qPHMuXnll43fbi7+sd/XaTpVYDwo8o4=;
        b=SNHftJy6PbDL08bJoU82HREmljtbs3RPmWQj+wrcHvKmnGTuIQgC+3k4NEF3+qrQ4O
         sLe1kz8ENXjakZRvTgu+AwrpdLFC1xZ4oZgDW57Q1lK7p6OTCEL8iNiSYrNp+TbYvrHp
         NoFjodX8STsqRq5H35FM5p81+klroe7XLnapnI4MROVvAgJ76+WMp4bpM9FNUjTcZldC
         MMhOwf7F84LFxRalthj4lRfs4CIRygo6pd0wQGySpAWOyyHo0IPIpi5JmsMNL3Nhl4cb
         YX7L8TgXDZ2jPNrudiw4TEbee+Pl0xJU+qcCL/gzUdK+xU4ZdmEMfJbrXty9YBCpww2i
         1faA==
X-Forwarded-Encrypted: i=1; AHgh+RrHlm5Kazp4HhZkbLG9qUvMAUqFXNNR2v8fjYvj2a1yGiG4mjqTWe3Xxmpmi1shaHxsoaw=@lists.linux.dev
X-Gm-Message-State: AOJu0YyvqbVpy9iLpzfBnPG2PIwGdjNmJONfH8trPSDliVGipUGkyNNn
	/cZ12qrhZYBq/hsYRa+UNALq6MMbd+L/A4yuHDOa+bciwr1PTuU2YwRc
X-Gm-Gg: AR+sD12iSVg8bj2qY3J8zLGnS8G9747uRlWdPHzjjhKACDA9jHmtrfAZlbIwMVx5nsW
	181VgXBNmondAsAEV9LVayUpdtEKntavjSKaiksmf9d5q0b22AXDyy6tji2c87wKTJxrmnzMoE9
	mXGA/V9kGRCWQqAWypO733Tz6IwI/cIL7siNKX4giUI6KrkRmTQOPtokokF8j4KgTkrF92I7UBB
	EWBvhI/xv3Usbw6BEsUid/M7PYORhiRRlMXULZUS8nbxcJzt4ZAN9XxWHkPl02sEU5Rr03Qwy0X
	w2aL4y6DnK3T4sd4HjShi3zOymDY9q5YlTBi+S06IifpksmeAHiHlX02UhB5bcutxqPEwCb+TU4
	sFWWRclXbQ+swChgtTvBi8t3Y/wNvodqlYaD8iAK3VqtjHc8HutTxIC3ua6Yba1NzvQn6NIRDEv
	nZFRkgCVZyVZBtxDXMdPRk2Tkqnbu97c7yNBbyY0YgcwX41Y2Lye2oFN3HktfURR/GXEXKLIaP8
	TJE9dr8mM9YNCC052lsABhtOfDqUQPpZcYrcZTH8dOe80ZJU6BqryBBK32R+AxSBUTL
X-Received: by 2002:a05:651c:2108:b0:39c:f58e:5c5b with SMTP id 38308e7fff4ca-3a11a6b4a36mr4705651fa.18.1786610060867;
        Thu, 13 Aug 2026 01:34:20 -0700 (PDT)
Received: from ?IPV6:2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703? ([2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a11b43f7fbsm2860831fa.37.2026.08.13.01.34.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Aug 2026 01:34:19 -0700 (PDT)
Message-ID: <f5c241a2-00a8-4a32-bad5-3c89fb204b25@gmail.com>
Date: Thu, 13 Aug 2026 11:34:17 +0300
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

The BD73800 uses different registers for 'out' and 'in'. So there aren't 
really "GPIO lines with a fixed direction mixed together in the same 
register".

I, however, see some good stuff being in the linux-next! Finally a bit 
of flexibility in a form of callbacks a driver can register is getting 
in. So I am somewhat hopeful the usability of gpio-regmap will finally 
increase.

I think the BD73800 can indeed use the gpio-regmap, by keeping the pin 
direction information in private data and adding a custom xlate, which 
errors out if get is requested for output pin, or set is requested for 
input. I am not sure how much of an improvement it is compared to the 
patch v2, but I'll give it a shot :) I believe the new -rc1 isn't that 
far away, and hopefully the gpio-regmap -stuff from the next will be in 
it together with the regulator stuff bindings depended.

Thanks again for the pointer!

Yours,
	-- Matti

-- 
Matti Vaittinen
Linux kernel developer at ROHM Semiconductors
Oulu Finland

~~ When things go utterly wrong vim users can always type :help! ~~
