Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793898763;
	b=eJLlJuwrjgShSuhv+1NGjBryur9UkdD5iUY8DtKVn0YniWiVT1aU+rxnqEdzmobXPdOK
	 /zG/2hSLWRun1NfIMo3U5o/6r/Ey/NLvwKudpoKMnOOSsCQx+fraoO+4iuZsl/llfSIR8
	 NYam/Z98Zq9svUjOGXFyTj1wbNDZxi+GzNq4x3l9k/aDBR7s0CIt9EPYekGbNEZU/hQyG
	 wyMLd78TuVYnwLRuQ7QN8zuZExxVrRUHc7sBhwVMYa2ZqY7WyCLH1crdduvN66n2cSJ3v
	 5pc5rSCtoj3L+iq7H8zvYs90MfZVQQBykwFofRbvT0tHqi4ZF+T0OBfrECGKq//7prw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793898763;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=6amY5D6rlAH4aaMfXl9jZY5MGkhAr21ewvoOis6OcXc=;
	b=D2mbFjKA5dUiwaiuGXbpcHUC0HzMoZYVFrQHDgzqtHKelTJL896ZL4cH617hHfaKsIkR
	 TvkVOlsljlPuKH6OnBV22+hGx1T0RsIpvtSjig/z/GV+Yu8qJKuQQ54/2Fh3WuvefqfyO
	 mtK99WFV0SRqnoHFrVw8eo29GyaZnhiTdeerytIl5QJlsAcxEzmChZD1kmQtuJnEGdByF
	 VCF8AQSxPwW1VJGMtFCwlC8iNA9baRGU7okUgcEukLQaFllrkgVGPrCNDv0FBV9wAwCUe
	 C77rwFuvMHXBCxiJ44RPhNQsVMyGy+G7VIdDlH6uzbN1lqKypiVON1O+1gjhXyuDJXw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RZUyptLW;
	arc=none smtp.remote-ip=74.125.82.171
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FEB9606D829
	for <mfd@lists.linux.dev>; Thu,  5 Nov 2026 17:12:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5FEB9606D829
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RZUyptLW
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-3535a54bed9so2816241eec.1
        for <mfd@lists.linux.dev>; Thu, 05 Nov 2026 09:12:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793898762; x=1794503562; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6amY5D6rlAH4aaMfXl9jZY5MGkhAr21ewvoOis6OcXc=;
        b=RZUyptLWj9hwvaQnvIwefo+57Ptnid8nYs/bOehlXoqVeALUOGD3ZaoGj1VpvG2gvk
         af88GTIa/W1+rXmr8v4C4bHDv79V2YngMATeSS6NYThogWaY/iQw9NtLcDo90EuWqPVG
         sDosgh7G04+dk7okd3EjxX6RPIYJwne0WtQAiGWSdtmS7PZCiqQdZvlVyxiMQ9m6caen
         Va7ryYIEE9WIuqHjOdxVd63JPRTXaT8jRP6ptAjAdvIvgShnfFLw0mQoYJR4u5UySitu
         uNJLxzR8a07Eujd262KADp8Nfy3AwRF/9t03zfxdnMJXxPEYo59t3HMXm0HFRsEDeqPb
         kY1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793898762; x=1794503562;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6amY5D6rlAH4aaMfXl9jZY5MGkhAr21ewvoOis6OcXc=;
        b=ZoE5Ou1b6bjWThy3u+60FT5ImZZHWbrc8s9f8l5RWFmyZ8KOSlYjQsdPLR6wHSArBc
         0HaI1QR+5OVz8Km89CbqScvLOPVeSntwvKeSH9vAx1CrZObOLmMx9bX183G+/KI7a+vo
         vpqeQ0Iohsgiq8Y9DvS/H0vdWcWCQmXVN1umObz2EAN+B/4HvC7lQT9Kyr9y2sv3PxXb
         k+Lnrb/5i4z9+RUnu9g6mD7Gu/Yx2Oo8IIbAkh1UbL24uw5BzWp7UQ1j425WpVEvTwk/
         CNe7jr/Mg4a2KMhHvN36vuUEdp2TOLDFy4dImfOasrz5z0M11n/7QBlfYhBIz1NIMZt6
         E6fQ==
X-Forwarded-Encrypted: i=1; AKwUvBxRldeO0qEf/v6BpwowM89lyjs2aE+xiGpl6+8ArMyM/47Xp/hurXePdbneZ9N7/g5X3f0=@lists.linux.dev
X-Gm-Message-State: APuU4Z+Uwqff2cdDHTKlWZ6lWedfbxk7V/QGnb59NWSKQ7LlBbmY63dx
	2whRPYEtl8PBUENs33EGx4q0Hs+5HpDwYiWwnROYSyWHgMq6h5g6RCP1IYcYlg==
X-Gm-Gg: AYBFou0l8jztecnQ1A/h8mDgNB9aAqwKDfTnMsxWpf220ECxzokNdo1njLgf5ogSFD1
	OlZ6V7QJNsUFDJb9hkI40pTcd4IdE6wQ+1lIN5pwgTfNKZKfztzHcspeOs0JxoUM7hS1P6k5tiL
	lcjvUgaN0YKL3bp6Uo+DSJSXNhDuTGQAS3QVMiJlLF9l6mWsd1NiqFjFjVKQWw85tHEcA/3Zob3
	eV3s24tXmLah28Y4+eF9lHex79lLXJUpRN4XKWF6CKvg7sWFq0oirkVEuw7NBsQrX+ui+/pXzZd
	mvbZAR9PbWO87vVA5rl9TJUFf92fc7sANmqyPrIsDLCo/8RKbnwMnlE/xFxFtMG7eJuYYxjXrez
	NulEg4l+4cuWz781gWQrhfEY9infmZ2n+w3bu48pLguCZ6c8T1M2r8SXkbiwl9hf2BNTSg/9mrS
	kTzEtkSwcMbQ+JXprjeruvhumAo9Ya+VKhvfR58z7224abBktPKfUmNQT43k2iVKtkq+HcVPChV
	5K6RLyz5hObVZsnBoL34IS7ypDLHHICuNpAYseFVRQp6MD+t+Ypmekjt+TZ+3Cc4SbX5oslVxPx
	1f5yJPYheNl5D6Vg7AmsLqe8uRoIQeUVDQ1XX+RUdWs+0oiwrXQEQGcQvdw2MsDY9Uhc4g==
X-Received: by 2002:a05:7300:dd09:b0:36e:370d:2127 with SMTP id 5a478bee46e88-36e370d264amr3168344eec.32.1793898762203;
        Thu, 05 Nov 2026 09:12:42 -0800 (PST)
Received: from google.com ([2a00:79e0:2ebe:8:c8f4:b7d9:252f:4483])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36ca38a6d3dsm22255325eec.7.2026.11.05.09.12.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 09:12:41 -0800 (PST)
Date: Thu, 5 Nov 2026 09:12:38 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Lee Jones <lee@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Peter Griffin <peter.griffin@linaro.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Russell King <linux@armlinux.org.uk>, Mark Brown <broonie@kernel.org>, 
	Charles Keepax <ckeepax@opensource.cirrus.com>, Linus Walleij <linusw@kernel.org>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, mfd@lists.linux.dev, linux-samsung-soc@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, patches@opensource.cirrus.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/4] mfd: wm831x: Support software nodes for DCDC
 regulators
Message-ID: <auy4Qbxg-pW_X37E@google.com>
References: <20261024-samsung-kp-v4-0-e21253295e68@gmail.com>
 <20261024-samsung-kp-v4-1-e21253295e68@gmail.com>
 <20261104181429.GE1650678@google.com>
 <ad02069b0cdede7ae191e4a3df57f33a@gmail.com>
 <20261105085321.GG1650678@google.com>
 <85817548-28f8-45ed-987d-a4996c2bc4ce@app.fastmail.com>
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
In-Reply-To: <85817548-28f8-45ed-987d-a4996c2bc4ce@app.fastmail.com>

On Thu, Nov 05, 2026 at 02:43:17PM +0100, Arnd Bergmann wrote:
> 
> As far as I understand the situation, wm831x was used on the
> reference board (Samsung smdk6410, removed in 2019) in addition
> to crag6410 but never anywhere else upstream. The question
> then is whether we'll ever see a DT conversion of crag6410.
> This would require finding someone willing to actually do
> the work, and coming up with a way to handle the autodetection
> in mach-crag6410-module.c so the correct spi/i2c codec
> child devices are probed.

So I guess the question then: do we need to keep this board at all? Or
it is time for it to go the way of the dodo? And then we could drop some
more drivers as well.

My goal for the series was to move along legacy gpio API conversions, as
well as move away from the GPIO lookup tables (ideally I want them gone
now that we have software nodes supporting describing GPIOs).

Thanks.

-- 
Dmitry
