Received: from mail-oa2-f9.google.com (mail-oa2-f9.google.com [74.125.231.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E934534B662
	for <mfd@lists.linux.dev>; Sun, 20 Sep 2026 02:48:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789872513; cv=none; b=NR96puO1yXFhz7+Es+BVGBQKM4jKhd5fXdha7T5Fg4ZkLsH8x+gBPRAFTtu7m+Bkcg0SzxX7W2IQWxHlyGo82k5JdYPXbpqwSq1pjSF1wfOx2psIzr77AQyOs8ja76o4r31zsKPwh04o4+7ovwWdkEi88ygMEDQDEB1Pck7wft4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789872513; c=relaxed/simple;
	bh=5zJQUcTfeHOupAFBO5SzKmha1B+IVgnGLyfPlMQyMi4=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=m7yam1s9VXHLmxSZq5dn6Jkn0v/R+HUMLTo9oAs7pEzNovajzqw8qNiLpk58aB60XxN+ND4suZng4ECG+FDFBV3H9Gc6KGvlCopHh0bwodEgS0JqCZF2hiEF3PfhOxXXIcI9qPE+1ONno+EBZzZ6Cw4mEOxvRY3Y2aHdF8HWvwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dScLXXuJ; arc=none smtp.client-ip=74.125.231.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dScLXXuJ"
Received: by mail-oa2-f9.google.com with SMTP id 586e51a60fabf-47bd4bcc3e2so905072fac.1
        for <mfd@lists.linux.dev>; Sat, 19 Sep 2026 19:48:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789872510; x=1790477310; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=TjvmYyCc6sVH2RWH/PPf9bwAMgPY9Arl3SG7xhOPHXY=;
        b=dScLXXuJpuQeOVoNpZ4NhmCQxy/67RpBny+nZFVbRLo6XBuq3ohltk5BEIob5rMRxm
         vEtfQEMegz68q9zvgT5YCz+nbwSfVwSz/MHmEV5AQgU0LOuAYO/5IJgoyxtOwV1waal/
         gFrmLM8ZpXjTGMuNOMVba8wjsrVz5t6BU7o8q1BIXF0p0od/MHO46+QYESg08oVaYD70
         3uoTQO6Tv5ffrUs34g9e4230WowIdTTl1UHhvJhYeRkD+1HiscMNPPe4bOywdymdf7Gc
         6oPi7odDSxhDf22jmSKz3JDZLthF03NjtjoEnJhO6ii6nK5+uK/7AlCfGDpKZQLsYkW6
         ZBrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789872510; x=1790477310;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TjvmYyCc6sVH2RWH/PPf9bwAMgPY9Arl3SG7xhOPHXY=;
        b=e1U2YDKC4TZUUnnLrO+phvW6sPREsROUMfVL8ndB6F/MuQWoRbSeKXLmwNl4/1iaHJ
         yo9yygroL3JsGYxG3Y/ZfRzgnx3AchZJu1ewgs9XVlc8mJ7iv4s+atPqNbCtNgduCQuR
         ih+vDBFmcRoS2WtcIJvAqPjud2gaE5rV6c9S1t1wDHbRXF0wOv48iGUswCxxqspLFaaw
         lSCI/ECrqSZzQChG+T2bUS2MtrgxlAhSaAN9JJSxorYnBcL4shkXhzQu/foDeeYJJDN3
         ZeIuZJvlM3554QNDl8AV/ehXxLrUyiCkJ1NFv3uMk+gPWw2ABn9mM7XjwPcizL5t3ntU
         iN+Q==
X-Forwarded-Encrypted: i=1; AKwUvBwVdIOPFVT/uRTgB/bi0xlt1rbkO9qG40vt2UJp66LlfIiZ2usBjZm2qYY8iHqxDi1EymE=@lists.linux.dev
X-Gm-Message-State: AFuF++mg59QexvtwILLb1vOwtOyZGOhLmOiWTL2oZzW4GZEm7dX0rp2Y
	rIUcu7bxFv147jmfiHy5FZHEAubEW4/3tPjRs0chHG+WCKXbC/DFnnSq
X-Gm-Gg: AYBFou2aIMqT9OtaaTR/JNZ9f4sD5ed8gUMA+d6st8neREwsTDE28vHTO+2hyau9TKp
	bcnHvdqb32XCJIouPq0MTwcb4bNVN0ILb/UScWoDqwYHfHuqkdYO4QN4xAOC3CxHAnWgr/GWNF/
	dAWSBkj1gmvrUn51jHlzElnn0SI078iqy+q4JEUiIk657YfoxRJg4le7EiJMgAlhGQTLXBlaDWF
	XJ1iVsacY+fTIwS62H4jkNjaNKA+rGph+JcjVvtWRxEwoGcCQvyz2etu/tpoNLDfipcCxPMtMJ+
	Ys5ojo2B6PgRwIF+4yw9NXDE3iHhgvzIvsU8Skv3uwcEaLGmd9zXZ4vqlNY5acmEaovX1tHPphH
	/jagvgZqzRl/kNlx2QqnvFk9tKxvJChVSti/hj+xeRarGb30qEHaes2djWdwfdMxqRYuqO3kLad
	LwU9DRdgCco4tcnnyOD5SCiizk6tGZIlDLuUOSq2cT92gJC2c+PQ+aIcvM5GbR1Aao0dmiwZOhJ
	OlqQ5J34U1OeT5tCTsG/PAvBA==
X-Received: by 2002:a05:6870:d24c:b0:43b:bb18:affd with SMTP id 586e51a60fabf-486e554a334mr7101333fac.8.1789872509696;
        Sat, 19 Sep 2026 19:48:29 -0700 (PDT)
Received: from ?IPV6:2600:8804:5716:d800::2620? ([2600:8804:5716:d800::2620])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4881f4d519fsm4188565fac.2.2026.09.19.19.48.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 19 Sep 2026 19:48:28 -0700 (PDT)
Message-ID: <7f1ab011-c90f-42fc-bc4c-836a1ef9febc@gmail.com>
Date: Sat, 19 Sep 2026 21:48:25 -0500
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Ryan Brue <ryanbrue.dev@gmail.com>
Subject: Re: [PATCH v2 2/3] iio: adc: mt6397-auxadc: add mt6397 PMIC AUXADC
 driver
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Jonathan Cameron <jic23@kernel.org>, David Lechner
 <dlechner@baylibre.com>, =?UTF-8?Q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
 Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Lee Jones <lee@kernel.org>, linux-iio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 mfd@lists.linux.dev, Roman Vivchar <rva333@protonmail.com>,
 Luca Leonardo Scorcia <l.scorcia@gmail.com>
References: <20260917-rbrue-suez-upstreaming-mt6397-auxadc-v2-0-db35882a6080@gmail.com>
 <20260917-rbrue-suez-upstreaming-mt6397-auxadc-v2-2-db35882a6080@gmail.com>
 <aqzo2vqeGEGCLFIP@ashevche-desk.local>
Content-Language: en-US
In-Reply-To: <aqzo2vqeGEGCLFIP@ashevche-desk.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/18/26 2:31 AM, Andy Shevchenko wrote:
> The below should be part of the comment block, no commit message needs to
> be polluted with this.
>
>> A new driver was created here, instead of modifying an existing driver
>> such as mt6323-auxadc or mt6359-auxadc, for the following reasons:
>>
>>   - Both mt6323-auxadc and mt6359-auxadc select channels through a request
>>     register (1 bit per channel), while mt6397 uses a 4-bit numeric field
>>     CHSEL in CON1 (10:7), and then pulses a START bit (CON1 bit 0).
>>
>>   - For mt6323-auxadc, which is the closest I could find to the mt6397
>>     (CON0..CON27), it has 13 more registers than the mt6397 (CON0..CON14).
>>     It uses CON22 for its request register, and reads the result value
>>     from the same register as the ready bit. We don't do that - the mt6397
>>     has a factory calibrated value for each channel at 0x16 higher than the
>>     raw value. mt6323 also has a 1800 mV / 15 bit scale / resolution while
>>     we have 1200 mV / 10 bits. We also have some per-channel preparation
>>     that we have to do before the burst, that the mt6323 doesn't have to
>>     do.
>>
>>   - For mt6359-auxadc, it has a more generic framework for describing the
>>     AUXADC, but it assumes requests are channel-per-bit, and so we would
>>     have to basically ignore req_idx, req_mask, rdy_idx, and rdy_mask.
>>
>>   - We also have our own software sampling, which the vendor does too
>>     (Amazon Fire OS based on Linux 3.18). We'd have to have our own
>>     sampling callback to do it.
>>
>> Assisted-by: LLM
>> Signed-off-by: Ryan Brue<ryanbrue.dev@gmail.com>
>> ---
> ...here is the comment block...
Done in v3.
>> +static int mt6397_auxadc_read_once(struct mt6397_auxadc *adc,
>> +				   const struct iio_chan_spec *chan, int *val)
>> +{
>> +	struct regmap *map = adc->regmap;
>> +	unsigned int reg;
>> +	int ret;
>> +
>> +	ret = regmap_update_bits(map, MT6397_AUXADC_CON1,
>> +				 MT6397_AUXADC_CON1_CHSEL,
>> +				 FIELD_PREP(MT6397_AUXADC_CON1_CHSEL,
>> +					    chan->address));
> Make it two a bit long lines rather than four.
Done in v3.
>> +	if (ret)
>> +		return ret;
>> +
>> +	/* START is edge triggered: it has to be lowered before being raised. */
>> +	ret = regmap_clear_bits(map, MT6397_AUXADC_CON1, MT6397_AUXADC_CON1_START);
>> +	if (ret)
>> +		return ret;
> Does it need any settling timeout (in case it was set before)?
I don't think so. The ready bit gets cleared when START gets raised, not 
when it gets lowered, so a missed edge wouldn't surface as an error. The 
poll would match the previous conversion's ready bit and a stale value 
would be averaged into the burst, so I forced one by suppressing the 
clear on START.

With the clear suppressed the set finds START already high, so regmap 
doesn't issue a write at all and no edge happens. All 40 reads still 
succeeded, but each one returns sixteen identical conversions instead of 
the usual spread, and nothing shows up in dmesg.

It also let me calibrate the probe, which I wanted before trusting a 
zero out of it. Probing the result register just after the rise, it 
counts the injected stale bits exactly: 93.75% with the clear 
suppressed, which is 15 of 16 because in the first conversion of a burst 
START is already low and still makes an edge, and 43.79% against 43.75% 
predicted when seven of sixteen are made stale. In normal operation 
everything it sees is conversions that have already finished, and once I 
subtract those out, what's left at 30 us -- which is where the poll 
first looks -- is -5.1e-3 +/- 2.9e-3 over 96000 conversions.

The two writes are never back to back anyway, since each one is its own 
transaction on an uncached regmap over the PMIC wrapper and the set 
alone takes at least 7.3 us. I also tried inserting a gap of 30 and 300 
us, and it moves the reading by under 0.06 LSB, with no poll timing out 
across about a million conversions.

Even though the vendor isn't necessarily what we care about, it also 
writes START 0 then 1 with nothing in between.

I don't have a datasheet figure for a minimum low time, this is all 
measured, so if you end up wanting a wait there let me know, v3 has a 
bit more context in the comment.

>> +static int mt6397_auxadc_battemp_bias(struct mt6397_auxadc *adc, bool on)
> There is nothing common between on==false and on==true cases. Make it two
> distinct functions and drop bool parameter. It's actually a recommended
> pattern.
Done in v3.
>> +{
>> +	struct regmap *map = adc->regmap;
>> +	int ret, err;
>> +
>> +	if (on) {
>> +		ret = regmap_set_bits(map, MT6397_AUXADC_CON0,
>> +				      MT6397_AUXADC_CON0_BUF_PWD_ON);
>> +		if (ret)
>> +			return ret;
>> +
>> +		ret = regmap_set_bits(map, MT6397_AUXADC_CON0,
>> +				      MT6397_AUXADC_CON0_BUF_PWD_B);
>> +		if (ret)
>> +			return ret;
>> +
>> +		ret = regmap_set_bits(map, MT6397_CHR_CON7,
>> +				      MT6397_CHR_CON7_BATON_TDET_EN);
>> +	} else {
>> +		/*
>> +		 * Every step of the teardown is attempted even if an earlier
>> +		 * one failed, so that one failing write cannot leave the bias
>> +		 * or the input buffer powered. The first error is reported.
>> +		 */
>> +		ret = regmap_clear_bits(map, MT6397_CHR_CON7,
>> +					MT6397_CHR_CON7_BATON_TDET_EN);
>> +
>> +		err = regmap_clear_bits(map, MT6397_AUXADC_CON0,
>> +					MT6397_AUXADC_CON0_BUF_PWD_B);
>> +		if (!ret)
>> +			ret = err;
>> +
>> +		err = regmap_clear_bits(map, MT6397_AUXADC_CON0,
>> +					MT6397_AUXADC_CON0_BUF_PWD_ON);
>> +		if (!ret)
>> +			ret = err;
> These 'if (!ret)' bug me. What can we do if the ret == 0 and err != 0
> on the caller's level? In other words, what can caller do in such a case?
Nothing, and in v2 it didn't do anything -- read_channel() discarded the 
teardown's return anyways, so the value wasn't even used. v3 hands it to 
dev_err() instead, as mt6323-auxadc.c does on its own release path, and 
the accumulators are gone.

The 'if (!ret)' left in read_channel() are sequencing the next step 
rather than merging an error into it, and the teardown below it is 
unconditional, but if you don't want 'if (!ret)' at all, let me know.
>> +	if (!ret)
>> +		ret = err;
>> +
>> +	return ret;
> This can be written as
>
> 	if (ret)
> 		return ret;
>
> 	return err;
>
>
> But the same Q as per above remains.
I took it a step further and made both teardowns return on the first 
failure rather than attempting the rest. mt6323_auxadc_release() does 
the same, and so do twelve others in drivers/iio that I could find. One 
does continue after a failed write -- ltr390_powerdown(), but it's a 
void devm cleanup callback that logs each error as it comes, so it has 
nothing to return.

With this change, a failed write can leave the later bits set. The read 
still returns its value with the failure logged, and the teardown runs 
at the end of every read, so the next read of that channel clears them.
>> +	/* Held across the whole burst: the channel select is shared state. */
> Unneeded comment. It's obvious that guard()() takes the whole scope.
Done in v3.
>> +	guard(mutex)(&adc->lock);
>> +
>> +	/*
>> +	 * Once any part of the per-channel setup has been written, the
>> +	 * teardown has to run, so every exit below goes through it.
>> +	 */
>> +	if (isense) {
>> +		ret = mt6397_auxadc_isense_enable(adc);
>> +		if (ret)
>> +			goto out_teardown;
> Have you compiled this?
Yes, with clang on arm64 and gcc on x86_64 allmodconfig, W=1 clean at 
every patch in the series, and the codegen was correct: one mutex_lock, 
one mutex_unlock and a single ret in read_raw() with read_channel() 
inlined into it, and no path that takes the lock reaches that ret 
without passing the unlock. The only two branches ahead of the lock are 
the SCALE and default cases, and neither takes it. Still, I missed that 
cleanup.h wants goto and cleanup helpers to not mix, and I shouldn't 
have mixed them. v3 puts the sample loop into its own function, so 
read_channel() becomes setup, then a conditional burst and an 
unconditional teardown, with no label.
>> +		fsleep(MT6397_AUXADC_ISENSE_SETTLE_US);
>> +	} else {
>> +		ret = mt6397_auxadc_battemp_bias(adc, true);
>> +		if (ret)
>> +			goto out_teardown;
>> +		fsleep(MT6397_AUXADC_BATTEMP_SETTLE_US);
>> +	}
>> +
>> +	for (unsigned int i = 0; i < MT6397_AUXADC_SAMPLES; i++) {
>> +		ret = mt6397_auxadc_read_once(adc, chan, &sample);
>> +		if (ret)
>> +			goto out_teardown;
>> +
>> +		sum += sample;
>> +	}
>> +
>> +	*val = DIV_ROUND_CLOSEST(sum, MT6397_AUXADC_SAMPLES);
>> +
>> +out_teardown:
>> +	/* Lower START so the converter is not left armed between reads. */
>> +	regmap_clear_bits(adc->regmap, MT6397_AUXADC_CON1,
>> +			  MT6397_AUXADC_CON1_START);
>> +
>> +	if (isense)
>> +		mt6397_auxadc_isense_disable(adc);
>> +	else
>> +		mt6397_auxadc_battemp_bias(adc, false);
>> +
>> +	return ret;
>> +}
> So, this function has to refactored. And please, compile and test the code
> *each* time you update it.
Ack. Admittedly I hadn't tested the 'goto out_teardown' path prior to 
sending out the v2, so I apologize. I have now tested it by injecting a 
failure into each of the helpers read_channel() calls. All five paths 
return the helper's errno, the teardown runs, and leaves every bit the 
partial setup wrote clear again, and guard() releases the mutex.

I also stubbed out the teardown as a negative control, and the same 
faults do leave the bits set in that situation, so the check can fail. 
The restructure is in v3.
> ...
>
>> +static int mt6397_auxadc_read_raw(struct iio_dev *indio_dev,
>> +				  const struct iio_chan_spec *chan,
>> +				  int *val, int *val2, long mask)
>> +{
>> +	struct mt6397_auxadc *adc = iio_priv(indio_dev);
>> +	int ret;
>> +
>> +	switch (mask) {
>> +	case IIO_CHAN_INFO_RAW:
>> +		ret = mt6397_auxadc_read_channel(adc, chan, val);
>> +		if (ret)
>> +			return ret;
>> +
>> +		return IIO_VAL_INT;
>> +
>> +	case IIO_CHAN_INFO_SCALE:
>> +		/* 1200 mV full range with 10-bit resolution. */
>> +		*val = 1200;
>> +		if (chan->channel == MT6397_AUXADC_ISENSE)
>> +			*val *= MT6397_AUXADC_ISENSE_DIVIDER;
> Make it if-else.
Done in v3.
>> +		*val2 = 10;
>> +
>> +		return IIO_VAL_FRACTIONAL_LOG2;
>> +
>> +	default:
>> +		return -EINVAL;
>> +	}
>> +}
Thanks Andy!

Best regards,
Ryan
