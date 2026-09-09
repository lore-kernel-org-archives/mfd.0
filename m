Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 157735803A1
	for <mfd@lists.linux.dev>; Wed,  9 Sep 2026 14:09:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788962951; cv=none; b=VuPdMjR1XP+jpDKi+jY7otJj0qHqDfWRDvb5mOEALY2RpslMnasaV8xwqN4qG1GwPTEPJVBuy2PrzOjIvJ66pk+aEMWDA2oMZHBE72I0TMdu+EB/h5LTDL9F+9kSReSrjpgnW1nauVIB7VRGu0UTO0o6P74iweNzBTLGwE9ZL90=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788962951; c=relaxed/simple;
	bh=KLWVqQguonffGnm851cAXBHrTBi1vUkJhAMAInMTy3o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=g+wwSXleZTgr8jO4GInC0/GugVw6upHDh++5eevChSnUTWtGS3F8eJLdWFvy2sMgyYTB90WtF0nPf9brHPs7xu8+tHL1b0Gh+BY0KsneuT0eR+DlzHfWWc9mmTudn5bunduhZbRXjJsu15idlXoJ752l7jo3h/+8GfH+SLbpRq8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=opqxq1Qy; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="opqxq1Qy"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-38e42560ebcso4501705a91.1
        for <mfd@lists.linux.dev>; Wed, 09 Sep 2026 07:09:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788962949; x=1789567749; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QYNhQ6Yi/iRYbkVUGBJRb8uet/bvchjSmRRTPBWP7EA=;
        b=opqxq1QyZdXJ5s5zsn1bsBz+emM+QvlcmQV91Ac3RLL7GG0ZWuJ7DV3ZweKa84YjCv
         6nM4nAlzaZT7YP3WswVGJjU8u0efxa5k+jERbxHFMiAxKE+iBZ5SUqZyQQwTFvL9KZpc
         IwUsFpxiQ1h3wS9ylbWcJeybJ2lupBmHZTyBAWS+VuAskhFBVnx58vvftTNRLmZxe/Wj
         o2OJFmjsjFekinGXpILtHzYs4kXZkeo4uUdzy5VFHmJSrZSPDh4tyvRXffdwHOZL+dtd
         ttru3J+z3Sfn5ZXnBmBRSDMbfiDJk9WIn2e1iAkZzjpQ0Dypbvw5AL/Y3+y38U8NQNoU
         +9Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788962949; x=1789567749;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=QYNhQ6Yi/iRYbkVUGBJRb8uet/bvchjSmRRTPBWP7EA=;
        b=duPnwT1aJhDPiraRS8kFZnjZ+F8bKAtwPpQXoq15X+UkIPs80BABr1WX6ijEBJiXOp
         Ts4uNTgkuBLQiPDcDMchajqAV68cWjuzF8iuUnRFi9Clw8bReCQUAxOA1EAiGE0aGZT7
         0uPpb8d0FVjWL1/69xZrGY0XnXYUwURxEJeEcwR5YRC5/85yKlnr2Z/CrOvxm5UN5MF8
         G+7DR3zZ+dA4Ri2Lo0HItoFwwitABbl9aYupC90x08mbA9oKGIZBT0IMCVmFRsRT/q3w
         WzlkeZqg4G7LkHsDqOEW4TbKFICdk2LTyFxukyigMK5Y9yGJwWzJkBFzYp1Yt3WPl32D
         mkkw==
X-Forwarded-Encrypted: i=1; AKwUvBw/yT39p+mxFWKPhSAStHwbmfTfAKxLvwXtfGnqGbq+DO3ymd/Zr3k3TYqHZlPdnrMJ6VQ=@lists.linux.dev
X-Gm-Message-State: AFuF++ndUYbwZUxOtYU54h/hWEpAwJ08DjxUmEyc5eUrmT865s9E3aCN
	jzhJ86F/SQdEEjmLHhfKwLkJtJJjTkw5KR7Jo0esIsqLRsELGpEkn34l
X-Gm-Gg: AYBFou2EKrYbUaDUS8nsVE0X6sHbYge9bL4yeKrdt7GbLb2ZAAUs7LlTkhPVxB0QMyc
	MdjOlYYyyhoQOVAqpj/sHN34rONBlhvlpiHhSgi/DDQo0+b3qCdHnCsz9um2CYkeF2C6g/qQ/ER
	t/M0I201EibZm7O5WYYgMo6xkPrb/4WItu/0i4wLqLpZh9dI1tqrWwYl+dOdoP24JiPjLgcK/3L
	4bTcTHhjW3zj6GIUqsz6LFOusZpFIEM+cWehvhWi9c9W8IyIrx6AAs4AXvkqJhppgQA5DmVHpnF
	LbEgg4f9utqx53pMnh+pn81LNgBXkhBjjY54QzkoMNB9GZAaxwVZajPWikFU1rmFde9ROoupbH6
	97Hd1DkSRunTOaK5Y8+Udl6AM1+SNLMpFa3nvYP9U/OF/36JQYz4CsjP5bU3WHNoNdPd7YgMHHt
	wg9s9WWwrH5YzQrXwdlISevGlggd6iXvqMjs4oQ5H0iHz/3uEd1GbwlBlDLUSYA7rL38goYHl3y
	lWEfkvfwZ0fH+4Xkt7Kvz4CBQk7/lvAWD5Veo4lJRu0B/yw
X-Received: by 2002:a17:90b:2b8b:b0:398:c0ad:711c with SMTP id 98e67ed59e1d1-39b26272f0fmr55218364a91.15.1788962948995;
        Wed, 09 Sep 2026 07:09:08 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b08bcd243sm39687906a91.5.2026.09.09.07.09.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Sep 2026 07:09:08 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <f54c391e-5152-4c60-a52e-9c997c16f706@roeck-us.net>
Date: Wed, 9 Sep 2026 07:09:06 -0700
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/14] mfd: remove unused rdc321x southbridge support
To: Arnd Bergmann <arnd@kernel.org>, Lee Jones <lee@kernel.org>,
 mfd@lists.linux.dev
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Arnd Bergmann <arnd@arndb.de>,
 Support Opensource <support.opensource@diasemi.com>,
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
 devicetree@vger.kernel.org, patches@opensource.cirrus.com,
 linux-watchdog@vger.kernel.org, linux-fbdev@vger.kernel.org
References: <20260909132153.1596191-1-arnd@kernel.org>
 <20260909132153.1596191-3-arnd@kernel.org>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260909132153.1596191-3-arnd@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/9/26 06:21, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> The rdc321x was a 486-class SoC developed by RDC. While RDC's later
> products closely resemble the DM&P Vortex86 product line and are still
> sold under both names, I checked the datasheets for those and found that
> the GPIO and WDT blocks on them are incompatible with the rtc321x.
> 
> Remove this driver, as there is no way to run Linux any more on the
> older chips after i486 support has been removed.
> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Acked-by: Guenter Roeck <linux@roeck-us.net>

