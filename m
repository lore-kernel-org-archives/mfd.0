Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793348668;
	b=IDYBWHmSdT0/76pCimHRDJVeVr6a+spueXZ8f/AzbAfHv0H/rEGoL89hLzDhR/UpWx7p
	 kwxWs9COt/5z7/2kV9kQ6+hbyNRCiA7+cV9RWQpRf7kDn+99Xicj7msKDNKoJTqslzBuF
	 OOzhheADAhfaVR75s4Zyhx/F20uQNDn/n/qrOeWEKtKUXTwVN5fD6a+/wWdWzHATe+noR
	 9jbMsIGunYlecgr+wxl4xc+GZPxuSa6ACeDc5fauB/wNbFLA3K55eRZ/DbQi0gbDMuxMG
	 dg8uAm6Gdh9Zyd0dQfGzDdFfeU4ATTbFi2AJPRCieN+9ZSr0VmThghri5Zxxx0lIY4w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793348668;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=LBx5ZpxvL51kA/xA9AXMyCE/PWXYo3//2APXf/k3LmM=;
	b=qPkcFZS0zAxC+CJgtNPnbIUZ3qs6XPLpIHU9QWVBgtKi08bXuLYMJqcXCxxcZvlmICaw
	 BXiPdxqxbHU9CFQ0xY5U8hyOEd/mzOl44PrR1+zhdWsW/AW4XRht0TkBKeK+B9lBgwi6f
	 i7oEx7bfO0SD/wuEW4pF4nFMycfaEu5L71zyXqYQYxmCYk3PaXGVHD2r9s+Ric2GNviEY
	 lTDVJGfQotuIxUygpVPMGcCvHa+Be9LhD5zlzVcJvmRfD5R3RSTHYq0zzF4xlt8zwEEEl
	 OEMkFdAaiwIYFW6q4Qu5qF2NZ1LBpCpT+kviScTYzsCNaj9YOrSQXdu0kAKQtbWGmRQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xjO6yFIO;
	arc=none smtp.remote-ip=209.85.208.172
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D260B606A31E
	for <mfd@lists.linux.dev>; Fri, 30 Oct 2026 08:24:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D260B606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xjO6yFIO
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-3a9e87ba696so3697621fa.0
        for <mfd@lists.linux.dev>; Fri, 30 Oct 2026 01:24:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793348666; x=1793953466; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=LBx5ZpxvL51kA/xA9AXMyCE/PWXYo3//2APXf/k3LmM=;
        b=xjO6yFIOT7d4LyBkRvFgqzQ5xdAb/RNe6U71ZyIpfutzFgQvt6HXl6a8fKcyvnp3E1
         lTTkwarsncuMlJsNVyOR9hhP3TX6msTFV8GvSexmsP+ocybcdGkqklkg8pJz6TDAkZlO
         yWlNs3gBquW6qDEZYWc9zxLcWlS1tcjcIvoP2tut5zzm10cbp5rsiwvEOBLaSMzAuc77
         O3if0XgK7ycO0+0Rgtb3bHNOwMFxAL4yT6RGHyrKO6w7VctUhtk6ECbwozRkjk39F/7Q
         W6qZ13Uf9GAa7uSxKTF2sFaSwIfBja85JaNRsOP7j6GKb4vJaQOcsLM24pyr+ltDP05o
         jX/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793348666; x=1793953466;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LBx5ZpxvL51kA/xA9AXMyCE/PWXYo3//2APXf/k3LmM=;
        b=1ttTdsVKRL5JsSCinCRMu9eSYWBnHL5ZkbMY8Px5EtUTtZ7UEcPgDpYTaPegQ5qgao
         dTX7yOhg0/g6SMdwXNmReTyH5oOCU3sT1+tceX5pwN5WPoEFcPIIpPDZlPO2whYU9dTS
         skdygLVWQREOX/7IFUt1w9H0AodijWHZWa65z3nmoFd8T7LzVRxxf9zSpncH5V0JGPQF
         HS1MuljbbxUVT9oGGSEqDpU3MXpEQRsKnJDF5HqpapuzJdZlnRb0UWcragv2TCrejTVM
         sfP3XuEp2lU2hdwrKpf5vNdnyYXBEnX20s5iMJrqz+59Z5Dercq2UvAoV1sF6eKN/Bqw
         3sgQ==
X-Forwarded-Encrypted: i=1; AKwUvBzRxGeCeThaIiAAFcBwAQmoF0BjKnBdH8kRLwX4hLDFWe5GR1v241l/oH2gz8VB8Zb5Bdw=@lists.linux.dev
X-Gm-Message-State: AFq9FYL68pGQgSj5QHlXOh3iNFgsscTqSlSBqhH3N2VK7zBoHdiBpMZq
	XaNDBbMKu3i/Gcuk54NOxI8FxQvgcdzK9Q215I1XKOjPH5S6cmhpMe0t
X-Gm-Gg: AYBFou3TCZMI+fGz4EwurD+p+0lO+G39AY8woIRWY+sm+Y4BmaxeQLNxlgyHDW55aIW
	hvMTt6vLJzRs5EyTOI9Dmm2Wbs2hj5OY2MpGIOCsec1wXWVad74NMzLYGXG7x2sI7uPN5MZSIbz
	TpVgydMKbsI0ujgXXxFj7xiVS8kFwWuF3CFENCxCotqTlJybfbouqSmJTmNRfmK9LhMBhJsEEyo
	ivxTPTLRtHwL3lRsN3gc9ihpNsEAlsH7zLP2GWZs7SjK2Da/zY5UuSXMWefOev80Yl43S2yYSds
	Z2EkfuJ7Q0eaiv7rIbNAnLcRzJ9/4hp6cxTD4KCNWhEAJl4l7nPrUC8WT6OgzWciYesWB0CrMfq
	be7+69MPnJUrtH53FieeUVLNJloqWJ8eHTAvd2v8OTnbkZ7E26mZ35oHtx8BFcrhDaoBlN3DWrn
	8ws0coeMlpexcKJLQNUfkHbdbLIrhMdqpp0SbhMM99QYAOhCSE03IAHw69bc4z3IFNejRH0zVwj
	SVoRGBTBUbW9kGOYMD+RL2GhB2zOeb3qTy5an8e1ph7LuVSgqTmX6hAqLPRmSgSmY+3CaTz+DPP
	evhcfdk+Gz7c8KRrbHjnWll/W40XtSQcZ8qe4w==
X-Received: by 2002:a05:651c:1a25:b0:3a9:a2fd:5932 with SMTP id 38308e7fff4ca-3acb7a651camr3189241fa.5.1793348665744;
        Fri, 30 Oct 2026 01:24:25 -0700 (PDT)
Received: from [10.38.18.54] ([213.255.186.37])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3acbbf3f762sm1753921fa.39.2026.10.30.01.24.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Oct 2026 01:24:24 -0700 (PDT)
Message-ID: <a83ade5b-b119-44a7-a5b3-3a7ef2d4eb2c@gmail.com>
Date: Fri, 30 Oct 2026 10:24:23 +0200
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] mfd: Constify mfd_cell arrays
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
 Lee Jones <lee@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
 Thomas Richard <thomas.richard@bootlin.com>,
 Andy Shevchenko <andy@kernel.org>, Chanwoo Choi <cw00.choi@samsung.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Andreas Werner
 <andreas.werner@men.de>, Frank Li <Frank.Li@nxp.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Liviu Dudau <liviu.dudau@arm.com>, Sudeep Holla <sudeep.holla@kernel.org>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>, mfd@lists.linux.dev,
 linux-kernel@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, patches@opensource.cirrus.com
References: <20261030071137.100954-3-krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US, en-AU, en-GB, en-BW
From: Matti Vaittinen <mazziesaccount@gmail.com>
In-Reply-To: <20261030071137.100954-3-krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 30/10/2026 09:11, Krzysztof Kozlowski wrote:
> mfd_add_devices() takes pointer to const, so 'struct mfd_cell' arrays
> can be constified whenever driver does not modify it in the probe.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>   drivers/mfd/ac100.c                   | 2 +-
>   drivers/mfd/axp20x.c                  | 4 ++--
>   drivers/mfd/cgbc-core.c               | 2 +-
>   drivers/mfd/cs5535-mfd.c              | 2 +-
>   drivers/mfd/intel_soc_pmic_bxtwc.c    | 2 +-
>   drivers/mfd/intel_soc_pmic_chtdc_ti.c | 2 +-
>   drivers/mfd/intel_soc_pmic_chtwc.c    | 2 +-
>   drivers/mfd/intel_soc_pmic_crc.c      | 6 +++---
>   drivers/mfd/max77705.c                | 2 +-
>   drivers/mfd/menf21bmc.c               | 2 +-
>   drivers/mfd/mxs-lradc.c               | 6 +++---
>   drivers/mfd/rohm-bd718x7.c            | 6 +++---

Thanks Krzysztof!

Took a look at the ROHM stuff. Looks great to me.

-- Matti

-- 
Matti Vaittinen
Linux kernel developer at ROHM Semiconductors
Oulu Finland

~~ When things go utterly wrong vim users can always type :help! ~~
