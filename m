Received: from mail-lr2-f12.google.com (mail-lr2-f12.google.com [74.125.230.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D59F9475
	for <mfd@lists.linux.dev>; Thu, 17 Sep 2026 04:47:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789620457; cv=none; b=BV5YIX/OoZPvJzyLVsBGg3N6ftqUIPxKsvVglY6MkMvfvgU2E3BCd05C2xZzrCaiBiks/z+8LPaVu3AudeQDjSZ1OxvCWmE+QcdX0DuytZPphvIh4+wRKeA/C70XdVbhTHaunvEPxXKpUUbac0IOFX6y90vsuMG5JyRWNGlSYvQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789620457; c=relaxed/simple;
	bh=Lrt6YFfTcQjqGuU5FoLFJmGH0jhGaULcXBP69mPmyDI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=t7mmUg4KytvISNOwtKAsZNAA24zF3wjwN9XG0Akdwej+RH5f8ezR8hBmWygetWQg3J3iHP9SvXu+2nRlDjd6aOG12a2fVSvTiC35j8JwzVggNsDuJAmp6FPi+qopoOaUKIrvTm89wKurWfL60adC4WGXY7rkSdQXFQzphRCt5SA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=r4LcVd6C; arc=none smtp.client-ip=74.125.230.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="r4LcVd6C"
Received: by mail-lr2-f12.google.com with SMTP id 38308e7fff4ca-3a49a10ee5aso3403031fa.3
        for <mfd@lists.linux.dev>; Wed, 16 Sep 2026 21:47:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789620453; x=1790225253; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dDYu3bsth7oi/7LPOhDffulZAY7dt7QNkv+9w7yWBC0=;
        b=r4LcVd6C8eaWvyguezDVEEpLrV8uDye2QkyaA92u9i6fDrtJd/GXZqHXhl9VC56FY9
         a12Btk3kOh9xqmDaRX3fCFYLI0h8J1Vk0amt8PdwkCGuBkzE4fLEMS9KVWVdj+/PgnZo
         eTeUSG9NCg5SpnNufABNsEn8XUETGLZw3QpKQ5jE+3HuWMObAd9t1HiD4s5nDewIgzxe
         t5gvg5w5BZLTYDP0FHgO1V2jtt6UtSJhoJGY7Qs2DOFOcac5dfPBZZGm/Yg6v6MlLvFO
         KxJSf4vt7m2Tfh2GMWG4P5Uhh4UWeJe1vDEXz1ZYs+E60EXtJDUwTUzvVg8GH+p1MRIj
         zcvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789620453; x=1790225253;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dDYu3bsth7oi/7LPOhDffulZAY7dt7QNkv+9w7yWBC0=;
        b=DoJUad+KpRNZ8840zap0Ym/ksZF9lU8fmDPQ4ZEbeNslZXOo0VPXQWuK0qNe8dMT22
         aOSeJa7kYiyu8qlgg3PzVwRz7CB5qR7lo72ZsiBAoy80MHlbXR+6uF5bvs9Y729PR69C
         zwfVS/BEWt4pDt/dKzV3ijFl1K4lDDrxVl/Ww/Xq/+no8rcGUBLqZ7H7ohr811ZQ8suG
         bBf2S3L0PLhovjxet8ak4wpSkHfhSv6WalkPM1Wbl8svbLUx4AQuhhGakb8DjG7Sgz65
         3VWiK0k9n/1PdlVSHDeSZAxNtiNgBg83/gMI6d+ZwzCpIVLE0nrKb9rebfKDy99EAIKS
         dVgA==
X-Forwarded-Encrypted: i=1; AKwUvBwgAA29KrLIH9spNjutMHX87+YmSLTuo8fskNdHNVea08QnN6/4VQpCrivFSGVpRdoqSwg=@lists.linux.dev
X-Gm-Message-State: AFuF++nx8uRqUUco0a55oysJHeI9gqss96OiKD0Obka2bZMbd29uaH62
	fYYvSnddTaMFTv1uDIiR+nk8zNUUD7/FWtEd068DS3amlPzT0TMMUJc+
X-Gm-Gg: AYBFou1uXGdZAlih+ods+T7RanufHdDeIn11h3Usf+RSV9Dn0IFEVFjF4NJTCvRSwSO
	Y0LgE8ynnA02ZibYld7QJrXzHe0J9OenqKYDVBM0OVpqLXtcLjejIrU/ZKbpvgIQh7MmZOWrRd3
	ID+Y++WqNmxzKIp8C1wKby4J8/K+3jUwRymodknICnrNP7L3zKWyivq0cMC3QwHN9HIWiaHvhtJ
	nNemyZDZL/zFE/0DAnICspG9XGN9AtSYMiK7xDooMjPNm3VleHmC8aWQ457buPW3ltstf+dZKEM
	c8E86b0DuQj+n4nw1qCQd+ydEUFgm5UKTXCGBfZbslXXDVEEyIHyu7ESWuvQkrF3b9a1b0eewG6
	GJgTX7ZYjoR8RngAGm1tq3BT2CcVh2rp57qiaGuuubBUNmrc3Hs99hBd/1EZqKNyPq66b7p+Rg9
	25Taz6eHzBW5cffy3BUzDQUpqGVIJnotmmK/beycNpnI2PhdaOOFEnwEwhGdmPEqf2ws++xBUi8
	5Fd4YouomsdZXNYZN0v2MJMK8dQEvAElUovbw/OA40q+945RScloMA=
X-Received: by 2002:a05:651c:2107:b0:3a5:a106:ee0 with SMTP id 38308e7fff4ca-3a5dca17909mr10468881fa.24.1789620453050;
        Wed, 16 Sep 2026 21:47:33 -0700 (PDT)
Received: from ?IPV6:2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703? ([2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a5dafdc6fcsm11590281fa.33.2026.09.16.21.47.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Sep 2026 21:47:32 -0700 (PDT)
Message-ID: <f50e6a88-3436-424a-8df7-8d5e01ee531d@gmail.com>
Date: Thu, 17 Sep 2026 07:47:29 +0300
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 09/10] gpio: bd73800: Support ROHM BD73800 PMIC GPIOs
To: Linus Walleij <linusw@kernel.org>
Cc: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
 Matti Vaittinen <matti.vaittinen@linux.dev>, Lee Jones <lee@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
 Brian Masney <bmasney+clk@redhat.com>,
 Jerome Brunet <jbrunet+clk@baylibre.com>,
 Bartosz Golaszewski <brgl@kernel.org>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Michael Walle <mwalle@kernel.org>, mfd@lists.linux.dev,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-rtc@vger.kernel.org, Sverdlin@mva-rohm.smtp.subspace.kernel.org,
 Alexander <alexander.sverdlin@siemens.com>
References: <cover.1789538455.git.mazziesaccount@gmail.com>
 <e3e6ac712519326cc25fcdd0a0c8e3cc42ef55ab.1789538455.git.mazziesaccount@gmail.com>
 <CAD++jL=vZr+naVBaixNkDbgx4_EpL8MosSyXYb9jg2hgKu+QNg@mail.gmail.com>
Content-Language: en-US, en-AU, en-GB, en-BW
From: Matti Vaittinen <mazziesaccount@gmail.com>
In-Reply-To: <CAD++jL=vZr+naVBaixNkDbgx4_EpL8MosSyXYb9jg2hgKu+QNg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 16/09/2026 20:31, Linus Walleij wrote:
> On Wed, Sep 16, 2026 at 8:12 AM Matti Vaittinen
> <matti.vaittinen@linux.dev> wrote:
> 
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
>> Acked-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> 
> Looks really nice now!
> Reviewed-by: Linus Walleij <linusw@kernel.org>

Sorry Linus! I dropped your tag from v3 by mistake. I hope you didn't 
waste too much time re-reviewing this :( Well, thanks anyways and again!

Yours,
	-- Matti.

-- 
Matti Vaittinen
Linux kernel developer at ROHM Semiconductors
Oulu Finland

~~ When things go utterly wrong vim users can always type :help! ~~
