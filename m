Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20650569F37
	for <mfd@lists.linux.dev>; Wed,  9 Sep 2026 14:12:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788963172; cv=none; b=F/9ZvQWBhfTmtdbH49sS4+NMQMtpnwBqH3l4kzbOhIcgm6YG90tlXeYuopdg10+osd6DCX/GpSgfwzbFDNjnealJBnrp2wf6yuvpdF4mqavCJUZMmcoeM5z+90alEYm/zbENWjiuwtciVVZUOHoCcivG0JuNaWNfp1o+v3DH5CM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788963172; c=relaxed/simple;
	bh=VAUG9ocA9CuuA3ZZK3/Ji3B3eMK2e7/A4q+kEwaraLM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DxXHmj6TB+OIBPkJd2rymLEc9yU881mkKwA+a1fdpv3dF5MLXhFWRH7ZoVHmA9CshMgxaGV9aP3RKsqBPmoXHXfR7QXqcKuig2cHYdCFKnTaEcz6bkFnVC+uuXK4k4tNIEaE4SV1qNm5etlGqhRnoxy8P2rchbKEA2WZTCiD6zI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RAmGaEu9; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RAmGaEu9"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2d58efc7356so76099965ad.1
        for <mfd@lists.linux.dev>; Wed, 09 Sep 2026 07:12:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788963170; x=1789567970; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2bgojeFeUpvXitpM/OgDxaX8mLFSNcZ2WBsJ3E6rjeI=;
        b=RAmGaEu9USn1B0XCX0mDhImboOy54QJj9wHjXWjWhfhOGj+x9rrJ2rGeSEvzsb8crd
         vsx2S3yVjNwVM88uEHPtbv9v2WNaD/taeFiW+LdhyKCvUCYVG0/KpBKCbOxK0QvETqel
         ETmxREptkC/a2341KHcPnwBRTHes6gWEUX+Hec7YEOIlUlyHChtv+bf59/FEy2F8FfRp
         DDGkegyNAYdwXGFP4cqZ7mYDxrMl60gqy+msRDHpxNYSATYC5q20JIU1/xldmAi+f86N
         Q10UOSbVtKKr/xjsi6Aqa4by+ExuSo3UlQWClxdAVHvy0hLTDfJdRc9T3hT/5bYjGCc1
         F8wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788963170; x=1789567970;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=2bgojeFeUpvXitpM/OgDxaX8mLFSNcZ2WBsJ3E6rjeI=;
        b=b7fxWvVGIOF12/Bjkag9L0AWe3PKtllSP0HwfJOlDfBTerTcfCws/I93vxYSny11YG
         rhs6UKLJlYrzo642twD4Gs2Re1ti7RQH7Sl+Sn93XL3h7N7Lv6bU/pSNd2DpmOKhXfr0
         cT7hWOqpirU/sHtJz8kldmpJWqo1YvmPRu3rJESvjWTrb5/c5Ifa9gzME2/IuxUc9gTa
         zouPSq5k7gYY6AyWgTfBkjZBa6EFnqU7w6F07usOAZ70pJ2TwZaKALmA1bv0P39dc0Ud
         yHzaL5u5K0sF38qhPRgDtdBuZHobvR/xcobaJr5UsnoGx1iJ3HbyN7LcUnRkjR2ivLHj
         uklA==
X-Forwarded-Encrypted: i=1; AKwUvBx1LM2ok75doFDKsKE2OmBPbafky5SEzdhxjU3ZHURLnYpGhUNZ3UmIo7+NHivU5U21Qfc=@lists.linux.dev
X-Gm-Message-State: AFuF++nrc08Afltv8K8IOTBe936JwVh0bmAKEX8C+D1rQYMk23WzfVhp
	mtW3e8E4ATgx4bGNCA+ZZWlP+LXAEaSCjXIY+Mth24FXBa2M+k196rVo
X-Gm-Gg: AYBFou0A8W/PsA7XWX+R9F18lMpVcV6pyFK4mVQ3RjTS9wdHVi43iGPxD7yGAcWZJBE
	maV2SZ9L4J1CeHOA7AnNp6DyI1KVrHaIEoCk9hXuNU8oT9hidgxjfw+anBJFTzmwRAnjx3R4BGK
	dgpqx0IXE26ks/yFLpyHFQ7RXYKLH0r2OffjOTMeYdwjn8DIfdgffRyElJav6Rv2+SvzyHHhJji
	oMGscrLe04DUB/Vujjyn7kG7q05tKCfNiUqfpC9pZT/5DVIwKt7fly2yUli6aH2mpZjfiSIVL+Q
	imF4J/hmrgpkaOXYUyIBBenSgbrFCFEhUuSnVtbNVhkIVMQxsl8SmijgyMAuQ/g0Nc9wZrS7Xbi
	R3hApEqKGwRK5AqHCUDCnhOtmh4JyiPqrLhDJlV3o5nRDBFbpzPdcz8r6NhXfD1cPHy4gXBwhst
	2sxmb/FPGp+ylJG1suF9TypbM7uVrFjbChVfi6fzm6aURi9KMYsrSRl/AdgPMjEjimpq1ODYz1I
	60c4p+bFUVH0r8yXyfvt7grZUdTJZFseMyHPQB2iQKeSOm6
X-Received: by 2002:a17:902:8203:b0:2d8:d4d0:792c with SMTP id d9443c01a7336-2db1287779cmr388670795ad.16.1788963170238;
        Wed, 09 Sep 2026 07:12:50 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2db14ae7637sm74597655ad.79.2026.09.09.07.12.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Sep 2026 07:12:49 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <43a1bbe0-0012-44b1-ab0d-0dea1136869a@roeck-us.net>
Date: Wed, 9 Sep 2026 07:12:48 -0700
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 11/14] mfd: remove unused wm8350 driver
To: Arnd Bergmann <arnd@kernel.org>, Lee Jones <lee@kernel.org>,
 mfd@lists.linux.dev
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Arnd Bergmann <arnd@arndb.de>, linux-hwmon@vger.kernel.org,
 linux-watchdog@vger.kernel.org
References: <20260909132153.1596191-1-arnd@kernel.org>
 <20260909132153.1596191-12-arnd@kernel.org>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260909132153.1596191-12-arnd@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/9/26 06:21, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> This driver was used on the i.MX31 ADS reference board from Freescale
> and the smdk6410 reference board from Samsung. Both used platform_data
> based driver probing and are now gone from the kernel.
> 
> Since probing with devicetree has never been supported by wm8350,
> it is clear that nothing can use the driver on an upstream kernel,
> and it is unlikely that anyone is still interested in a devicetree
> conversion, so remove it.
> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Acked-by: Guenter Roeck <linux@roeck-us.net>

