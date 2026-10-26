Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792997774;
	b=gCZPdtLnYPLh6ic/USnxV4Yu5qJ8PUK6LKtfc4452BqfgngpqhbzfNS1X0zzQoFV2gnS
	 oBgQVuwGZ0ieMVU1q+sY2+5MshMNbN77XixaFoPb5lAs8w6Z/DgG3z7mf6JzQN/s7BIjd
	 Di0BP/HfNYnCmaHy9wZDpS3ZQWWiAN2bmamwgFfh5Rh6MPVH7sCMRKAi1g52n3w9r1xYT
	 I0UBxvrWVckNBzVnIzcL5Sme1dOkfl45W4VSOcdCYSA0mh4z3zBjB1O0HTtPRX4lWsdrA
	 CzPLKf1HtGfJ9ThzPiU1+8LHjvsJ91oz7qEPZYuDW0oXtLZmIA/HyHvcDeIGXgG7y0A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792997774;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=XUKCZGSOsmkTZezLt/menhKq9E8Hwz9jGRuCv99W484=;
	b=xXgyRn6O7EMAJae9fLhFROHkk4SeHwkyRmnN14ZTT7q4YpVzxIaAWl2Tnx66n1Yj/pj8
	 njK8jruH+hzemMciU8FbNt/KKa2VcJOus+zVBdQUSxV4wtGn7X7d5leuCizLWYfSEt1nw
	 LflSoqRMraa7w27pALleaHMHyYiC/4sCh1/yB18KaKm9GAlujglIsJY1YsmVCr2WTgitH
	 usXh5sSJZ1C95kwgjC5+EZowMk14PuVNLMpM346bi5yohyb4Uh6IR++wWG356oFIXP5GS
	 JKmCrALDW5mDK4ZoR78bLfaBqMA4da2XMIzTliGUCAYQ3Q0tfHAilSACohlW4ehXOgg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=EF1sVuFw;
	arc=none smtp.remote-ip=209.85.167.46
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDAF8606A31D
	for <mfd@lists.linux.dev>; Mon, 26 Oct 2026 06:56:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EDAF8606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=EF1sVuFw
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5bfbc25a76aso772459e87.0
        for <mfd@lists.linux.dev>; Sun, 25 Oct 2026 23:56:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792997771; x=1793602571; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=XUKCZGSOsmkTZezLt/menhKq9E8Hwz9jGRuCv99W484=;
        b=EF1sVuFwWag3eosBErbaBI45QyJNcfmgtGHOkcAE4uaoNXuEvJK2yyl2fBdD+lN8EQ
         IxjnE9agv6iFbo5v9vY7m1oyFdCYwwmWuFgDgDgY8emx3udJC1VE5ryBCP+4uFdxIYrP
         y49WTtY7ylJcEZrvLW9CzApeCKoKN4ai8r2d/DRDWAUIpvPO/NsZ5EXphiQZ6Q3EM2gT
         ZdApY/72m6xHSnGjcNYqcr3ZL0mHRc67iv95LdjHxLmxuCGVNy1B43ZkHT3qecyzXbn8
         2zd1Vv2ycds1kWj/d34jCmork2Msk+9wk5BkGnzToP5E0O32tkmE9Eh0GX/fflr6t2sM
         7NGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792997771; x=1793602571;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XUKCZGSOsmkTZezLt/menhKq9E8Hwz9jGRuCv99W484=;
        b=u2m+MkCrKI1tYKzTgqvZBgY4T1uTyVhhv2q6TZ99ISR8DDW9fzAMIYilQe7XH83IlC
         pj4L1jedV89LH9B7y6pugOQdm/WThW/pgQS5eVgvJysHTD8zjRfu8x+++zyoMkcCvsbw
         OJF+CQFWrgPJiP4xjZdXnnq/m7YGsun+zq4hUn+dcqM3Q0lu1tGEkb97LR3RuFCLd+0R
         1BpY3nrWKfAon8iiC/7NX2kkKXHsSxQsfsEIkW65cWlvEieIqGK/5zYvQaocnvtzthCg
         +OW1+3I1rx5IYgxFMRH5GfCth9b/6J21J71Nq4RAECwK6NFph/jwWwbcF8dAvSb+u6Uj
         tdmQ==
X-Forwarded-Encrypted: i=1; AKwUvBw8GVnr5a27n9sLSjkP/vgivLfEQCxuZJY4q1YGekMqW7J4fb0ShH4phxB6UZA8ICE2NoA=@lists.linux.dev
X-Gm-Message-State: AFq9FYJ2PeDWz8tZYNMZnAi8HAnrISMw6dalbcnOESExs0ZBUthUHigQ
	CkTf0/a329ij6eQ3tf2/ssrtsH+Fj0PYrYJ9K2YhJK4uogNEjg0b/t9p
X-Gm-Gg: AYBFou3k+bjla82cwUxpbCeck1E2k4fGxODkDLStavJACCbInTIVs5GKlM2TAgv8yYV
	K+9Jo75CnyKhCkYEXAJw+vlm9Fc/1OlLc9SjHL/LDLkXcb05OZIdUriwDIazWF8yLZQ0guJ0JNV
	m/L/hQrJ/hU/MfZ3Itc5yIwg8enTAKsLOK7j4yu2+jCgqFYJvUE6301UrWPP+DhOHIF0L3Wigfb
	ucEUF4TmiOwePJxdOM9+NWwb5LrCAwIASaHc3hEA+7H4kJKG+wtNE9jtfiOe3qQscXrXDntv+wI
	ofJ8w3B9xqSIuJf1+kxD9OrYiv8MFXf+DsJJknKtfaexrBCsrczqFb4Mm+wcQbrRITfcO3WaJ0c
	XkA1WJIafTd8jaqdA3FmIGkI9ULavtb2kMnT/sBJaE/kDuhPJgfKyOxpJvKFVardC6RzPdXWIYK
	V0ecITVwqs7NKzR3uPOXCkmB4IRQSIcjMp8SjqvW0YT96wf14V9HIN2q8vj4hHAK8U8dBMEuKwr
	yS5IUk0ZpSCe2ZTlrT2exug62Drx/m8MpjEKsVLw5oKy6ptpCvBDLGxoz63MRhVzJeaK99mRCrE
	SpcL1E4EbNXdCGLGRuFjcgHkhX8Zc5WS5l47
X-Received: by 2002:a2e:9816:0:b0:3a9:8775:5f11 with SMTP id 38308e7fff4ca-3ac6fcbfba3mr9796481fa.4.1792997770891;
        Sun, 25 Oct 2026 23:56:10 -0700 (PDT)
Received: from ?IPV6:2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703? ([2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfb7a6b051sm1356960e87.14.2026.10.25.23.56.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 25 Oct 2026 23:56:08 -0700 (PDT)
Message-ID: <24bf0964-dd2f-4688-bbf4-cc891c674d3e@gmail.com>
Date: Mon, 26 Oct 2026 08:56:07 +0200
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
Subject: Re: [PATCH 05/28] mfd: bd96801: Allocate watchdog IRQ resource on the
 heap
To: Lee Jones <lee@kernel.org>,
 cover.1712920132.git.mazziesaccount@gmail.com, mfd@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20261021121245.3111563-1-lee@kernel.org>
 <20261021121245.3111563-5-lee@kernel.org>
Content-Language: en-US, en-AU, en-GB, en-BW
From: Matti Vaittinen <mazziesaccount@gmail.com>
In-Reply-To: <20261021121245.3111563-5-lee@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 21/10/2026 15:09, Lee Jones wrote:
> bd96801_i2c_probe() declares struct resource wdg_irq on the stack and
> assigns its address to ddata->cells[WDG_CELL].resources.  Although
> mfd_add_device() deep-copies the resource table via
> platform_device_add_resources() before bd96801_i2c_probe() returns, the
> shared cell template and the shallow MFD cell copy attached to the child
> platform device retain a stale pointer to the expired stack frame.
> 
> Allocate wdg_irq on the heap via devm_kzalloc() alongside regulator_res
> so the stored pointer remains valid for the lifetime of the device.
> 
> Signed-off-by: Lee Jones <lee@kernel.org>

Does this warrant a fixes-tag?

Other than that,
Reviewed-by: Matti Vaittinen <mazziesaccount@gmail.com>

Thanks for fixing this!

Yours,
	-- Matti

-- 
Matti Vaittinen
Linux kernel developer at ROHM Semiconductors
Oulu Finland

~~ When things go utterly wrong vim users can always type :help! ~~
