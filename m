Received: from mail-qk2-f13.google.com (mail-qk2-f13.google.com [74.125.230.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC39B544887
	for <mfd@lists.linux.dev>; Tue, 22 Sep 2026 12:37:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790080681; cv=none; b=a5aNUj/nUd5nbdWU1URp4bBz2J1iBZHX7ZeQH5QgXX3p1crqr0dDn57TJ4qmO7/bvfj6CbprPv9tBtNIRDarGQaUMkLBi/ImfxI2zh2zBZ+qbLPfbm6F/MUtIBV0T/KcQH2JN4f+eOz/bWgAF/dN4OmQa1+JWa7kXFIKftzghmc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790080681; c=relaxed/simple;
	bh=H/P/6p4tn/F1HONtpik9rVj8NHKsX7jwfbvX1rYbyC8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DZKIXPIt+hC0Kcbx0EUn1Czn1YdPL5mwW38YeZZPbk9mnzCcDXXaW6duaJ8oYZdJLbjTzu4XKbPmXr6/F7/vOrcyhCmHCXyM7zPGSbclyI+AvY0wQaoYiCRluZzeWhNKF+EZBH59i9qe2NRYVl4I1BhQ0NrC39bHV/SxGlQu7QI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=I+o14bJT; arc=none smtp.client-ip=74.125.230.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="I+o14bJT"
Received: by mail-qk2-f13.google.com with SMTP id d75a77b69052e-530301ff353so54395811cf.2
        for <mfd@lists.linux.dev>; Tue, 22 Sep 2026 05:37:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1790080676; x=1790685476; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DMkuwapQF5xBh7yi5E/o9NS5zNE7MVMoqBZQFdDzhrg=;
        b=I+o14bJTjZYhTdNQHOQI6xUG6F6uQwScsxaA/zDEjDnjjYCDom+bAv63dH/TYNOtlq
         DGm116kvA0yg0cPbKcSfFJnolCEXMSu5/NPhnEep30yeYT7616fZmOAS8iv+z8vIndd/
         LFVS0Uc9ZfjHfmeILWRahfewH5qwGxI4HzR7qNJF+Rq6t1ZVYv+alaEohUPlDHx7RnY6
         pI5+P4fffrUTqJZv2/pViHUYr8s73/BUT6fcMFgMwisZNNkeacKkxDF1et1yyeD7LTxU
         FP39ZRKbOKdrB13oaR0b1Olv7ROqBZTZf1chgnsz+ZSrGWrjbQjK8Bjd6B6/HYskKxiC
         PTTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790080676; x=1790685476;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DMkuwapQF5xBh7yi5E/o9NS5zNE7MVMoqBZQFdDzhrg=;
        b=WTR6GddFEvawZNghgc1SJ5zWrZTScLPYpA6JoCJyX8tTjK1Gee2L0nEaoTaRFdgFPl
         G2PzoYB3R2lXS+IhwZsSJJ8mKSxN16fxPmWW59HjBTALgCnTm4OQrrEMaTlpLRgAZGP1
         QheuSAhIsaJuQnRLC4QsTdwDmLDbuWpgWjOJB0rb1g5zUgCBi/ZSoKuoURJAi9w3Uw9B
         jpYk2APQxJNsMTTu3RFmyZAjqcqhRnNQqSVDVz2PIE7DLM1O3oK6dKVmrnkVhBjulXAD
         sRycMvI9vnlhhXWTI7dyM6FzVE02ABOYnyW0iUxS+OWP28B42wWNvzf4q+ttFfX3oklS
         oY8w==
X-Forwarded-Encrypted: i=1; AKwUvBwPDorxUzgzteZKzT+262rto7l3aGBYhbQMaZGWmr5vS7viXZgn1mORaKNyronLWubWzZU=@lists.linux.dev
X-Gm-Message-State: AFuF++lGDSB6G006IVkd9+8UbAIV0fNEvHWQAWQFpAcAfVvyU+4mOA5q
	CuEhfWfEw+XvMA55Nm5vIh2lmLXSwb0I5ShZ7SpmMo+xy0+W/5jn8iNQXfpPNXbGCoo=
X-Gm-Gg: AYBFou3vfA3cAtcUczSiZO8JB/NjiaVe0aweSJYLrmDcGN0Bhk79wTqwlkW3Vc4Prs5
	0zDfetXhmWBbNi0xewZJ8snZqcICzdjsTK9OyRJXYIlYqJn1z0b7tpY+tDx8N1qWkKIUSkZI7PP
	IL2wWT0Fcco+7HXcMvDJqd/pZuonYDftqHmQsKU28q5IWoRaT7WXraiyeLmVVtKI0Sq4+lSYune
	XFaNvCkwKKGUws3ILZAmZj2I1lHCBlJoleZo40/WgKhPFDztqfJkTAt2iC6oQbl1rVs+Wl7qc/5
	wT9zAb8MQyPZq4t2XW6NgrVhsIgb++m29thax/vNiDO9D00ekt212081rN6sVa4W+DCoy7/q4Da
	GwwnCiIdhZjjHet5wQhPnMjIL+qWof4kH27Yx+oylvvVcV8JLm97i1EloTrnU3bgf3L6qNUqCxP
	VRavOqhUM0cYQG/aMlEAOpnrnbNf5z2yhhK3UZU3FyNCoBf78Tl4zE2VRO7ullOti9jmOe1uoz
X-Received: by 2002:a05:622a:1790:b0:531:190c:85d4 with SMTP id d75a77b69052e-532dd3ccc11mr36804681cf.1.1790080675565;
        Tue, 22 Sep 2026 05:37:55 -0700 (PDT)
Received: from [172.22.22.28] ([73.62.185.64])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-532e18d753fsm11687481cf.13.2026.09.22.05.37.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Sep 2026 05:37:55 -0700 (PDT)
Message-ID: <28ebbf27-24db-4b5f-87f0-831d13f93b8f@riscstar.com>
Date: Tue, 22 Sep 2026 07:37:53 -0500
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] clk: toshiba: introduce a TC9564 SoC clock and reset
 driver
To: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: sboyd@kernel.org, bmasney+clk@redhat.com, jbrunet+clk@baylibre.com,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, lee@kernel.org,
 andersson@kernel.org, konradybcio@kernel.org, abelvesa@kernel.org,
 kees@kernel.org, gustavoars@kernel.org, p.zabel@pengutronix.de,
 daniel@riscstar.com, mohd.anwar@oss.qualcomm.com,
 lorenzo.bianconi@oss.qualcomm.com, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, mfd@lists.linux.dev,
 linux-arm-msm@vger.kernel.org, linux-hardening@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260918165234.687224-1-elder@riscstar.com>
 <20260918165234.687224-4-elder@riscstar.com> <arA1svdQzaj3VanR@monoceros>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <arA1svdQzaj3VanR@monoceros>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 9/20/26 2:39 PM, Uwe Kleine-König wrote:
> Hello Alex,
> 
> On Fri, Sep 18, 2026 at 11:52:32AM -0500, Alex Elder wrote:
>> +#include <linux/bits.h>
>> +#include <linux/clk-provider.h>
>> +#include <linux/mfd/syscon.h>
>> +#include <linux/mod_devicetable.h>
>> +#include <linux/module.h>
>> +#include <linux/platform_device.h>
>> +#include <linux/regmap.h>
>> +#include <linux/reset-controller.h>
> 
> Please rely on linux/platform_device.h to provide of_device_id and drop
> including <linux/mod_devicetable.h>. (If you want to go full iwyu,
> include <linux/device-id/of.h> instead.)

In general I would like to "go full iwyu" but have never heard
it expressed that way.  Can you recommend a tool available that
will help me do that?

It looks like "mod_devicetable.h" doesn't help much unless I
need struct_cpu_feature (which I do not), so I'll include "of.h".

>> +static const struct of_device_id tc9564_clk_ids[] = {
>> +	{ .compatible = "toshiba,tc9564-clock" },
>> +	{ },
>> +};
> 
> Drop the trailing comma after the list terminator please.

OK.  Only for the list terminator, right, because nothing
will ever follow it?  Non-empty final initializer is OK
to have a comma as far as you're concerned?

Thanks for your review.

					-Alex

> Best regards
> Uwe

