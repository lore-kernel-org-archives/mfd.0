Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795013019;
	b=sXphH2uWq5qATwYk/voWYVVGoyoHtWiIEhHf4+rcGmis4/eXC+4F9B8SfBs/iS7zLaGD
	 U/7KCwD86CTwCbrd6PWqAIJKOmLgX8dGuvOigzacLobUoQzr2aph26/pmIXtzvB6OD6lf
	 RLtKyeVPw+ZVoiaZun746xA5X0SPiknoVKdo1xwn2wer8rz7ggKnsvXqBTIr+I+x1ti+q
	 C82znM6K3Ijbmo6rfyRVOJxZ+FeoRcqlg9YkH9zRObOq9T4GC8DffqiOtcGbUJPQoeKN1
	 cXQTEKs9C3xteMMNOhr6KUeBjBhXMScQYH2+icZ4p28RSLNCp6hdGkNUQcx/GDnQqrA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795013019;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type;
	bh=lofE1i0lcl9nIDZVdZhTFR9XGUpRnG24017uwCNl4OI=;
	b=eXH1iu1isCQzeqdrDynvFj3pAeLkEh8TKibI+MiZ2Zv8ZpEzTBJ2DNvUHl4iEwFO2qan
	 vD7IPJBTmF0+R4kk57XpDR7XN2OfXAeu1tP7RlzK6P9FhEdZqPtkRQFcJG279pJwhDZk1
	 A0Oc9neUFRDuAU0u8jHv9dwuEdIjglEJME8o2o1ydG0qR7Y9pwvtG1GO27opxGp/e4/o9
	 gG4uKPehLWZ0Il5pNC3C2EAeyaOOCKkJBVyvYSbnfeiEsRICfHU110b2kbc/c/NY1YLKg
	 CnV0ACuHlMbGW8U7bPDcHq1e8Itm8KBDb0MYs2MgkBMOdbAi77qHJXnRN2DtGtp58xg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=mPieSCZ5;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48CF5606A330
	for <mfd@lists.linux.dev>; Wed, 18 Nov 2026 14:43:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 48CF5606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=mPieSCZ5
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a214c5c4c0so11277435e9.3
        for <mfd@lists.linux.dev>; Wed, 18 Nov 2026 06:43:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795013017; x=1795617817; darn=lists.linux.dev;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lofE1i0lcl9nIDZVdZhTFR9XGUpRnG24017uwCNl4OI=;
        b=mPieSCZ5R2FY+D9y17c5MMtObeNPB87aoroerDZtwQCIg2lfALm0j6W18RyIiHhxr9
         zgCrd8VF28ukZxXEcot678aOHq7fKx4xt+HeWSTP2GbOeVNzXIQRPOaKkQdN62vzOdvZ
         PJvM5b7rqYkY9veGH9Lj8hkxu1iIICnWUxnvh5oqN4NsB0U1BSFn2ZZn3UO0S1g/8KRz
         xWw0nZQgJn+2jRqhb4KzQf8NfhrSt201Fl5qQm3Zgg6WYI1TmIaLcc6FiuCtPkpPzCLQ
         dMQFOaPPdUugsFOS37g9vH3OOfaxFKy5EocGfy3sfLihxKxP0GPTqShLHoTJC3N2/4FQ
         FW9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795013017; x=1795617817;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lofE1i0lcl9nIDZVdZhTFR9XGUpRnG24017uwCNl4OI=;
        b=hlqylsbrucJwsr3ouBC3TWa/BRcJgflwn7BRMOTxGr8dSu/v2YRojRwmJeYsFSI/QW
         fAi/94cpqNIhxqlmX0Xww2qQfPCf13pZPjLWb5JMRf+8WfLy0gQNjlvtDYeR7vE+mAUu
         WvNlFPgE6havyOHmsd0ngIlSP8EuYf3k2Fw+XrzWs5UjrDxnZtYrywzN0r7UNGBCK8nu
         RDGXbueSv69JRpduImGiHKhWY95c28kvAKY55mfCj7j2el1q2Yr1EZnRo9po2OH1HirZ
         2mE1N2dvf4zZXaHDJ+Gj1SzkuhQZXdh2cDfyg1+EtNfiQi9z49JvpWqyWCQQ9KqFIoRf
         j+2Q==
X-Forwarded-Encrypted: i=1; AL+hErGgwuZjTPaQAeQRKCRyD80LPv6uDBQylDb6P7fSNjy7ch2MvI3lawbkVUIbPWOVNeaPIcY=@lists.linux.dev
X-Gm-Message-State: APuU4Z8dUJ2q+AkHAM5/QP/74k58iCWxt15nlywldFGHdykxPqTud/11
	BCNcJHbcIMeLFsvnvkzwbBFxWduzTUwKukGMOGqFmP0NFmFkDJSPuqg+B8uRwKknpbrgM5TZeYd
	11Yhe
X-Gm-Gg: AYBFou3qCM7M5CJz6ZZXp2+7s38b6fuNrNQKk2q6UMHtzMwWuWmD44a5PNfqIa9g6WN
	rMkL27e+SXdZe4U4XheI1lfqc1/h/pG/MIk0emEx10ljraMurhjekOlHREalf7jlTwCRZGs1x4c
	3Hn8s0prysBQl8LzVQCTzf681sp+yhyvLS39Fdt5+VL9bhI393mkSevPaRFb/UVuOo49d9VgJl2
	7alGqQDoGCpZ7UlPJRpcIPmXOuIjqUA9+kYDVDin0+vVD0WKgdKL6d4DrscfcYzcELORJn9Gjld
	o0K58R19qDmud3Z22/7+8zcwKzzcj+PVmbkqmB7iidkYWgtul58LctSzdgtVFzaE7gsre/oBF4E
	2QesFpHh2jnfi/pcRmfmvYlbS06BT4VOfqL+wNkOSf1iheZ18/AnwQEg1uBUPA8FX6YjUdzyuep
	e2RrOL8wJ8P36gfnUVxBiUdppge44iPReOcIzo11yAHCxbcAc0TL6UkTjSrpeABDy3+GXmUZNeG
	JtU4q+IWM8lL8EkLmUkay/Q4no1OBDBS40Jwlq5zux6vey9BIgXNUxX61c/uQeZTtmXxDmwbE0U
	ZXt9s0Mzqg91+donQ3idmaAVG4A704jTXakkwDf/omdySG9CjJKa3AlJCnEpMamn7OCqeg==
X-Received: by 2002:a05:600c:81c5:b0:4a1:f720:74cd with SMTP id 5b1f17b1804b1-4bb7da38bd0mr52621935e9.24.1795013017611;
        Wed, 18 Nov 2026 06:43:37 -0800 (PST)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb7e5919c5sm29710375e9.3.2026.11.18.06.43.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 06:43:37 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Lee Jones <lee@kernel.org>
Cc: Andre Przywara <andre.przywara@arm.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Hans de Goede
 <hansg@kernel.org>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, mfd@lists.linux.dev,
 linux-sunxi@lists.linux.dev, Sashiko <sashiko-bot@kernel.org>
Subject: Re: [PATCH v8 2/5] mfd: axp20x-i2c: Fix i2c instantiation
In-Reply-To: <1ja4ogfp5l.fsf@starbuckisacylon.baylibre.com>
References: <20260910-axp318-regulator-v8-0-e906a61a7f3d@baylibre.com>
 <20260910-axp318-regulator-v8-2-e906a61a7f3d@baylibre.com>
 <20260924082705.GO3864833@google.com>
 <1jy0cq94na.fsf@starbuckisacylon.baylibre.com>
 <20261014104801.GI199624@google.com>
 <1ja4ogfp5l.fsf@starbuckisacylon.baylibre.com>
Date: Wed, 18 Nov 2026 15:43:36 +0100
Message-ID: <1jh5he2o9z.fsf@starbuckisacylon.baylibre.com>
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain

On mer. 14 oct. 2026 at 14:21, Jerome Brunet <jbrunet@baylibre.com> wrote:

> On mer. 14 oct. 2026 at 11:48, Lee Jones <lee@kernel.org> wrote:
>
>> Note:
>>
>> --- checkpatch.pl (3 issues) ---
>> Line 2: WARNING: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
>> Line 3: ERROR: Invalid commit separator - some tools may have problems applying this
>> ----------------------------------
>
> I've checked before sending and checked again now, I don't have those
> warning. I don't see anything long on line 2 or a separator near line 3.
>
> Any specific way I should run the tool reproduce the problem if there is
> one ?
>
>>
>> On Thu, 24 Sep 2026, Jerome Brunet wrote:
>>
>>> On jeu. 24 sept. 2026 at 09:27, Lee Jones <lee@kernel.org> wrote:
>>> 
>>> > On Thu, 10 Sep 2026, Jerome Brunet wrote:
>>> >
>>> >> Apparently this device never really supported i2c instantiation via
>>> >> sysfs, because the driver does not even look at the i2c device data,
>>> >> which are not set. It would only probe if the device matched through DT.
>>> >> 
>>> >> Fix that for correctness, even-though it is probably useless.
>>> >> Add the missing AXP323 while at it.
>>> >> 
>>> >> Reported-by: Sashiko <sashiko-bot@kernel.org>
>>> >> Closes: https://lore.kernel.org/r/20260717090209.2A09B1F000E9@smtp.kernel.org
>>> >> Fixes: 41751b033aaa ("mfd: axp20x-i2c: Add i2c-ids to fix module auto-loading")
>>> >> Acked-by: Chen-Yu Tsai <wens@kernel.org>
>>> >> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
>>> >> ---
>>> >>  drivers/mfd/axp20x-i2c.c   | 24 +++++++++++++-----------
>>> >>  drivers/mfd/axp20x-rsb.c   |  1 +
>>> >>  drivers/mfd/axp20x.c       |  1 -
>>> >>  include/linux/mfd/axp20x.h |  3 +--
>>> >>  4 files changed, 15 insertions(+), 14 deletions(-)
>>> >> 
>>> >> diff --git a/drivers/mfd/axp20x-i2c.c b/drivers/mfd/axp20x-i2c.c
>>> >> index 5c93136f977e..a76bec5604c4 100644
>>> >> --- a/drivers/mfd/axp20x-i2c.c
>>> >> +++ b/drivers/mfd/axp20x-i2c.c
>>> >> @@ -35,6 +35,7 @@ static int axp20x_i2c_probe(struct i2c_client *i2c)
>>> >>  	axp20x->irq = i2c->irq;
>>> >>  	dev_set_drvdata(axp20x->dev, axp20x);
>>> >>  
>>> >> +	axp20x->variant = (kernel_ulong_t)i2c_get_match_data(i2c);
>>> >
>]>> > device_get_match_data() is bus agnostic and should still work from the
>>> > core driver.  What's the purpose of splitting it out and adding
>>> > additional call-sites?
>>> 
>>> device_get_match_data() works when the data comes through that path,
>>> which is generally the case.
>>> 
>>> i2c_get_match_data() calls device_get_match_data() then fallback to the
>>> i2c_device_ids. It covers the instanciation from sysfs mainly, not
>>> something usual.
>>> 
>>> As explained in the description, this changes plugs a hole identified by
>>> sashiko that technically exists but I highly doubt anyone will
>>> instanciate the PMIC through that interface. Those things do not really
>>> come as breakout boards ... That being said, it is cheap to fix.
>>
>> I'm confused.
>>
>> We already call device_get_match_data() in axp20x_match_device().
>
> Not anymore with this change. It is the point.
>
>>
>> So if you populate .driver_data in axp20x_i2c_id[], you should be
>> able to drop these changes altogether, no?
>
> device_get_match_data() only goes through the DT tables.
> Not the i2c_driver.id_table which is purpose here.
>
> My understanding is that if you instanciate the device
> through sysfs (which nobody does for these devices) and you only call
> device_get_match_data(), you will get NULL because there is no fwnode
> associated with the device, which in this case silently translate to
> AXP152_ID.
>
> device_get_match_data() does not go through the i2c_driver.id_table.
> Only the i2c code does, with i2c_get_match_data() and after trying with
> device_get_match_data() internally, which is exactly what we want.
>
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/i2c/i2c-core-base.c?h=v7.3-rc7#n121
>
> As noted earlier, this a problem reported by sashiko that is real but
> extremely unlikely to show up in real world. I'd happy to drop
> the change if you don't want it. It is not need to support the axp318.
>

Hi Lee,

How could progress on this ? I genuinely do not understand the problem.
This change is fixing a sashiko reported issue, in the appropriate
manner I think. device_get_match_data() just does not care for i2c
.id_table so i2c_get_match_data() is needed.

At the same time, what we really care for to progress on the Allwinner
a733 HW support is the rest of the series. So if this bothers you,
I'm happy to re-submit without this fix. Please let me know.

Cheers
Jerome
