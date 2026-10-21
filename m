Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792601581;
	b=UnH77J3aQjFhAkCrwyHZL9aBt6jib/QbuHEXjhfRTLg6BWZuD+ey4ny/FGqG3FyNFMN/
	 WXlKlbBWjF9TMPijMvqyxKSkV6XmqrgaAx9uQjkQM7Ph5c1+PnFa/4cVDRZ7zfBuFLoaf
	 AYsCWn4Jva+8WXrNnd/Ab8b4wRWBpTku5n3KSTV5o3s0IUCoO3f5rAr1lMayVJaR9PQCd
	 Ut3v6faCIwLXgPbux399yovtRRg3VTvje5KrU7fmdDIOwizGS/Yc8IebMTFd8CHnsnj2W
	 IA8FCW0QTYjBXFfPnYmiNgAc7Gvz7PVvSpkZoRwyIBXdxEJDJtmr84Qlwsac+OFbwvA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792601581;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=pKVlIvSF3bgj4NKmyst/GQOZtuCqamm6OCIrIl39yS8=;
	b=BNwhcOpTNJbm1F6JKEs6z14IUTxI578yCEbClvxO1e7hm69AH/G9psUXhHl1fvXPUNXs
	 Ur0OYDiatQhAtepEvwDleP1D1WqPc9ZSpO5FtBcH7h7ILCxjo19qY+cskdd6ptqDY5XvN
	 qaoUSDTjq9v2qYI0pT+8EUOLTChq+rAd8iGjN/ckwnuBFZ/FxB4YMXYQLqYQfU7vxVmoO
	 R7opm6BQ2SN54jRzKxvQeBQhUdpGp0qHvIwHGVIxh+wYwPBhcggWJZXLbHlXApJ9i2RXo
	 lfKZCBI0/aHOnvMnwVVUPR/47cdeCcgx7FPUBxAb96403S1j6n/zoABmK+ezD0gLnWw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=l60G5zso;
	arc=none smtp.remote-ip=74.125.82.46
Received: from mail-dl1-f46.google.com (mail-dl1-f46.google.com [74.125.82.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D546606A31F
	for <mfd@lists.linux.dev>; Wed, 21 Oct 2026 16:53:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6D546606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=l60G5zso
Received: by mail-dl1-f46.google.com with SMTP id a92af1059eb24-14394530ec6so1193696c88.1
        for <mfd@lists.linux.dev>; Wed, 21 Oct 2026 09:53:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792601580; x=1793206380; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pKVlIvSF3bgj4NKmyst/GQOZtuCqamm6OCIrIl39yS8=;
        b=l60G5zsoY7MnVEtru0L4dym6p5Jv03mG/tOWX96MVoT+n3MChftKDWxkeJZIfA64HL
         ZKzSp7ifN+6YM+iVjwhyBrMVIFjA+3xBux5HQTy65993yApLfVe1jOm0Ovr4g3doS96a
         IgBI/DvrliK2ocrNxF4iucRsUilLIWZLPwEKsHPkABE1XHU/JCWdyEfefER6R8WCBH3V
         zqhrgwoCoEzmq7rExhSZAur64rcVNXRbguzxXvXuAVpdZCAYnnFZHWEwUMTO/CzmeW0i
         R7O7m9Sa1atEBTxH6foKL7rMF4u+ZniYjucq0aHdca85Z7vzxZtYGt/I2+v1g6tGmZRM
         Sctw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792601580; x=1793206380;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pKVlIvSF3bgj4NKmyst/GQOZtuCqamm6OCIrIl39yS8=;
        b=mr6eDPn9q7axGskGpCGhrbCTjUjMYl5erOKe8xqLVrg8UgXE99eaeGxWflFXTICNqc
         OqBJU0bYRHLmjfyywUp0/5SmB8EOqijVaNMbQXwfNLuoXSObD8t7tduWUla/PsfwAQ7Y
         gNR/ZwZ6eyQfBhtZOE16D+qbw8IoRpJ9VOT1zw/SVNqHgH9KYgAuji9mOooDnTcTgPSu
         D/ANoUyE+XiboAHVNt3f0dfIxSIe3/Oq1umt8YUrVUOSssgVdmqqHqgQ69y0OgIt++xa
         VsgsGJkBrrhUMwREyeLnWBsoiPwPFCm1sHrc+S5oQ+I92gOAiJxwaMq26EKCual/eEww
         WBFQ==
X-Forwarded-Encrypted: i=1; AKwUvBwvVd326KVBbIRD8lVr83IU9+V3iVr8ZpYWgKTOYyhOrm8g1xL0AXGIGa2ACr3waxnggAQ=@lists.linux.dev
X-Gm-Message-State: AFq9FYI2oBtgOD5mW0lI6lpApdP0I5vQLWD8JA9vniD1SirnCUX0SHgT
	2IvV+w+mQOW4StpVe/H9C2cn0y+Ulg6nVz6kTxaAy2l/92uTSuZzQvGeAWupHw==
X-Gm-Gg: AYBFou2y6yF8eChmseTMjTNz/D/wqdVikhVJVocxlEfQfRC8I6FkdzqxP3Wel7gFZ2X
	WWMfq9ih2gsOGkZVCE2BNhvJ9HXvrNwFJspa2xOrOnk/Ag/rKTHUMlKznlLweO4iiRARFIMr4sk
	WQqnHfKT8zIttwtq5/IpN5DqtMkywyHKqTc83AB/uIUqClRciC0YlnecvaqjqzH6HDwdjrzBVQo
	Nz9kjEJ3ZiQIiCfzyD9gT1mQgtbdeYBnEe1ITv/Ik54M73LxE2Kg34t1Hoii+eYzr9u+z/x//Ry
	AjOll7WZPFfkTVnX3gd58Bd/Gg3YA+xKg8smqTpWRGkR4VyteMCmuHRllkGdy1tk0S/nZCWZm5o
	7wq5yTQ9meYehE+cAKXtKZb44U+rNktcpVdgcbRfFFjEUF/rAgYka9raMpP3E/DhBuXo3f54Seg
	rLcYeIPOqhWFapnfgBzFV6lmbqoVQ1L6ujRby2voQSO70l1pY6YZOR1LJOJfhaoySzFYvxw7er9
	pZKYC/WlzNblTyTz7fvSITHJrft/r7jBUSS/i3O/eLl5zj/cVNY9ZnFbFMl4rtuLbblbHAoQ9ms
	k1xaYU9eOU22v0S1HFT+Fw==
X-Received: by 2002:a05:701b:260c:b0:18a:6c40:1a35 with SMTP id a92af1059eb24-190a4e0f52emr2922497c88.20.1792601580385;
        Wed, 21 Oct 2026 09:53:00 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:92d1:8038:c4e7:1f0c])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1903e02901fsm7779991c88.22.2026.10.21.09.52.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 09:52:59 -0700 (PDT)
Date: Wed, 21 Oct 2026 09:52:56 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Lee Jones <lee@kernel.org>
Cc: Jonathan Cameron <jic23@kernel.org>, 
	David Lechner <dlechner@baylibre.com>, Nuno =?utf-8?B?U8Oh?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Shi Hao <i.shihao.999@gmail.com>, Rachna Patil <rachna@ti.com>, 
	linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, linux-input@vger.kernel.org, 
	mfd@lists.linux.dev
Subject: Re: [PATCH 28/28] mfd: ti_am335x_tscadc: Remove redundant
 ti_tscadc_dev_get() helper
Message-ID: <atjtywLzWKxoddD7@google.com>
References: <20261021121245.3111563-1-lee@kernel.org>
 <20261021121245.3111563-28-lee@kernel.org>
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261021121245.3111563-28-lee@kernel.org>

On Wed, Oct 21, 2026 at 12:09:50PM +0000, Lee Jones wrote:
> Now that ti_tscadc_dev_get() is a single-line wrapper around
> dev_get_drvdata(p->dev.parent), remove the bespoke helper and retrieve
> the parent driver data directly in the child ADC and touchscreen
> drivers.
> 
> Signed-off-by: Lee Jones <lee@kernel.org>
> ---
>  drivers/iio/adc/ti_am335x_adc.c           | 2 +-
>  drivers/input/touchscreen/ti_am335x_tsc.c | 2 +-

Acked-by: Dmitry Torokhov <dmitry.torokhov@gmail.com> # for input

Thanks.

-- 
Dmitry
