Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793886317;
	b=nQL8Eatxqw9gLNn4uKZUR2AoUTaEGbaru8jpCyiWvRANZjVgCSWXOltuyAqi7F0CEoIN
	 TTrLdsgMP6C0n/w6YmLla2LxYW5raXmwmOa+Le5RmEpqnOa6ree4U9BhNArKiKa1utECN
	 LNjjlnTXPdW0N6V9cHUTpswNTu/9bo7AfX+tevUHEnzm+wdqxGODWR9KHi34hLIM5zFkn
	 sSpEiwd9foh5m7S3iwhty8BmCrAewwAjXFdgaXh7vBiHBPeSlQ+4SHrQu1BHwcW4k+eDY
	 rP6RzEB17/kejIoW7TKE5QereEtrpKx0VMf3qXBApud1Kug8ID7Gnc0eUTXoTE6byIw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793886317;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=4SSzib5VWeur1UFjzFHifegpVxu2wOnePo4bxIewHVU=;
	b=Y4RlaXKnHXTi37u+UwD2gvigAjNV2zGz6Kru0yv2RnCTrisU8vOh9KbRt0QDXJjiZwtH
	 JcuTgJeLraKQfgzTq+XfynM5gh+mGEccYJ596aVHuv01c2NN0Rr8eVi4aAE4J3pOK7fbD
	 vjEBySNSUFkTx5W88OshfIenj/QFqSDK5RZkxXIS4m/C0YyU/JxEThZIgK3fZpzQdOE9L
	 s9iYSzrYYbJd6db+3f3EKrT9faZxpYDPxC/1oF1RZqEyFLMXNvA67rHsoLodoysoQwN5V
	 9UAaWMJWnfkyOtfcTXRPWVjvTJ2YfmzsX8osGTmIolqbCHkMEp6dySmwDvJW185x73A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ei6R82px;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 375BC606A31B
	for <mfd@lists.linux.dev>; Thu,  5 Nov 2026 13:45:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 375BC606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ei6R82px
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a2000d5fb1so11552265e9.1
        for <mfd@lists.linux.dev>; Thu, 05 Nov 2026 05:45:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793886315; x=1794491115; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=4SSzib5VWeur1UFjzFHifegpVxu2wOnePo4bxIewHVU=;
        b=Ei6R82pxnSEgGjsT9c7MwIYjHTFLIvBm177AR9WG5+qMEq4MbKgqw+x9kpTaLYOWuE
         EElCDSfJIg/Z/m0YhG4XE0tzAG/P0QbYVsg7fGk4Jlj+0OtLjda+nyIHUTpTbUO9kJM9
         UknGeEC7DZdMV81PWVah9krtBLpsCXnpExcyTAvKV0AUBoxzQwNkTrO67P0TU+yppTJ6
         YcqzMoms2y0Yf5yKDTHA8LlFbflxx37tzqCJH7W/aB5tK6VcgLJAwExDoEyBMyCTHa+r
         dwM5O4/hi8PxkqUa9BM5Ez3cIC89nITaqmdcIsC57Wa0zO9G0lppuDbk+lC9mmJzs3Jd
         1wsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793886315; x=1794491115;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4SSzib5VWeur1UFjzFHifegpVxu2wOnePo4bxIewHVU=;
        b=yCHlOo4cDf8PjCltkjD9or0LJUroDKsDpPkaF+vDdfgYuxPYrk0AzmHvWjXfzhtWKM
         E2gTZrowkqSt3m+edRKX2bc7Bf59lm9g1KSo3xIMhfbCvCjRnJyShYpHAiVkESN1HvWX
         0FDEkUQytDlPerT+qfdXhh7aXzbKCH4W31Xjmm9+jJzyohMs045OoF9xa/GJgvhe/rWk
         YCbVQMAUy0OCcoRCMPeHwNev6NIxHCxIE7+FXFx5guqmM5Spqsqo2/YbwWHx8UxG8DiS
         9broEK6ZmAIdV0DaiK9n1Y/FQ4jdy70kVYbry3QBxpxx7nv5FfG8oHNztajgYtT+Pnlm
         20aQ==
X-Forwarded-Encrypted: i=1; AKwUvBxBhO3XbcfP20RxLiEXyip9c+/W4cfIyZpDwnibW9R2BDo2usiCnK/VopKu9l21D/pudoU=@lists.linux.dev
X-Gm-Message-State: APuU4Z+fN5Qpkg9TdFhQfkvt/nWd9fDWcINBaeAMB5I52Xbunt7CjUy0
	lbujyX+//NPvaYIic48XClXZJXrz3DEleQt2+825ilyLJ2HzQqw3drYE
X-Gm-Gg: AYBFou3Muo/Jb2gfwzc17fahUPtLXaz9nx7u4o3hzDstpbGD/8AooERcPUazKI0DZqs
	oFy0MkvWSFrVFzVMkIjRotCSvFL+N7nvJQ0WYBO+6D7ycVMjPZPjTZkVbH8Bohmm2Xuyb3IR4r3
	dPPZymRZe7fiQqNDNJ7z033GUFm/QYxufiCvhu56N16w/NNyp85OhvXHqYnL6uz6KSzsYgYoUiz
	TPUtBuK4m2nmI47QlSAtva5tc4Vt5W2Mv4Zzt/FfJ5dvbotKMph7Nz75ALmQi3OcOQjWvFLiRqJ
	VEx15D89KMKFtLYvm7/5Px9rryGFeHtd/VpfsKUBIDsAVHC//fF7o/VaOZLriolM91hUt8YWdvu
	lvYYIu2fMa5HLKe3Y7DsS6NvALhXqIVKTJuzG2ZsINPcvsZk2hP8OvsUZxjEKJv6sAhwCwvV0hV
	hWTmpQiz/o8DJ7zLpqrRIJIr+ngu3KYnAldh/+Uy1DdqGo906+N26dnjVaZHb4AsoJIXohe+P1g
	YcEIRdZCMjlSgBJs5/UI7zkd1yAb1MIc51HHoikBR3wRT2XzkUkhvNzC9IX1rF7Trnsn4kX3Qwg
	CDoZjK9IZk6ktuWHAJTFxSjPqvfhuqaCHIaOqF1BauPEs4+XlC9F3cxbiIbJi6Mh8Z2qkw==
X-Received: by 2002:a05:600c:4714:b0:4a6:30c3:1114 with SMTP id 5b1f17b1804b1-4ac180f1c7amr420433645e9.12.1793886314348;
        Thu, 05 Nov 2026 05:45:14 -0800 (PST)
Received: from [192.168.2.178] (109-252-159-107.dynamic.spd-mgts.ru. [109.252.159.107])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b56eb4da1esm110800005e9.6.2026.11.05.05.45.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 05:45:13 -0800 (PST)
Message-ID: <3018a4cb-d986-4c77-a472-ca4d1b83c3b4@gmail.com>
Date: Thu, 5 Nov 2026 16:45:11 +0300
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
Subject: Re: [PATCH v2 0/2] mfd: tps65910: Use modern API for poweroff and
 restart
To: Svyatoslav Ryhel <clamor95@gmail.com>, Lee Jones <lee@kernel.org>,
 Aaro Koskinen <aaro.koskinen@iki.fi>, Andreas Kemnade
 <andreas@kemnade.info>, Kevin Hilman <khilman@baylibre.com>,
 Roger Quadros <rogerq@kernel.org>, Tony Lindgren <tony@atomide.com>
Cc: linux-omap@vger.kernel.org, mfd@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20261027152423.194794-1-clamor95@gmail.com>
From: Dmitry Osipenko <digetx@gmail.com>
Content-Language: en-US
In-Reply-To: <20261027152423.194794-1-clamor95@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

27.10.2026 18:24, Svyatoslav Ryhel пишет:
> Switch to modern way of registering poweroff call and add restart call.
> 
> ---
> Changes in v2:
> - swapped to use dev_err_probe
> - ddata is passed directly into handler
> ---
> 
> Dmitry Osipenko (2):
>   mfd: tps65910: Use devm_register_power_off_handler()
>   mfd: tps65910: Add restart handler
> 
>  drivers/mfd/tps65910.c | 36 ++++++++++++++++++++++++++++--------
>  1 file changed, 28 insertions(+), 8 deletions(-)
> 

Thanks for sending the patches :)
