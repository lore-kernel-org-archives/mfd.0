Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A84AF3D3002
	for <mfd@lists.linux.dev>; Sun, 18 Oct 2026 06:14:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792304062; cv=none; b=nz6y6b1PT8JrQAbB1zXFTttM7uKZumJGHEnDcDs7/ofoGMoANTMDOEpiajlt9TyXT+2b6B/ypI0+KCr7YjaEehmm9qsbIWBfR1gNKCTpk4lWnbmfBlasj8sDmtPQ/QMbP5XdRN255rl8jIDE0kwUrRZXNqTYzygQAn+L9quAdKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792304062; c=relaxed/simple;
	bh=+2lEsHyBEj6ioBUM00ZaO+fos5og6KcV34JeUe9h9kc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cldmkbyyY+4mnkIiz4fgLt6Dy44tR5kNycV6pLXGrxRr/wBB2X+ZgQ8cO3gyqznmHZpkHdVJIANAN64iYg4gszNvhkKbQYYFeAOfPwMUnpLeGTIf5hH0mgic/mW8KzNag41zUhROD6lK2TnycfuD8YTDmAjtJ3NcxzbBVsK/6aA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Nn6vzDW8; arc=none smtp.client-ip=74.125.82.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Nn6vzDW8"
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-15354aa70e8so394053c88.1
        for <mfd@lists.linux.dev>; Sat, 17 Oct 2026 23:14:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792304060; x=1792908860; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Hcz1sgIE2hsxMXDV8dXqqMZVM6gJO/fdOKrjWhvUYTA=;
        b=Nn6vzDW8jti1xiG5QVG1frBU4aWeZkHpZrfrdaQ5paZ8rV8BuW8o+PTrlg/uGA/SY6
         Z1GHuhB70ynVitoMtraD5M3LLCkK1L9NvCzEMHZLzmNj4DzS2uaqhjbIZnbk607e9rK1
         su3ovMAOAHjP26JoE9ky8dJ8amGDdCT8yaI6SzWh2LVqn1nWNP11r2DAJcGzwPmARc+J
         g0XK9lLXdpfeF04S51T/UOkUhQiRVVaSQninQqhRPFASBE9NkZzEmT7faItx3JDBmJow
         O2QpmFimCZIqNLMCXlREYBW8h4/g5z6pz8hGow4+Ny4NWVgy46OrjEvhuB6oQmMUB4l6
         5Z5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792304060; x=1792908860;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Hcz1sgIE2hsxMXDV8dXqqMZVM6gJO/fdOKrjWhvUYTA=;
        b=tngOYu3nsnbCjaQZU739n/oSgGzFS7LYPn5EMcZq5z/kVNxVAs/4HS7oW8mECcPme9
         Y9UeeTiaKtD1Qw0tOclwrhGzkg/sQPn6xfq31heoy1BiLZyhTNiQW2fr8FhN+B6p34vN
         8d/7gb14III7pREgXZTkYeocnh0ZIwch5H21HFqAOIfsY6lCDIC97P5T7fB+CJ+qREVK
         o+uQAcXIZEQMGzd3oaQoAbvS3XkcEwTW+SD8KW6ZdY9ok3INqHGp5pweYNNjckXSpYnx
         9lUTrIejfpkjBx7KKKtvVQ4+aYj0EjIfHkl10HdeojH6mHEicZeBu5QFkyD4nkQLXi/a
         4cyg==
X-Forwarded-Encrypted: i=1; AKwUvBy3UEN6gACas0l89XEFlzRX7YpRekXzJC22ZwywoM9/B0HHoukILHNWXJXKwel79NKab2w=@lists.linux.dev
X-Gm-Message-State: AFq9FYJHdNLQ89Q53/phsmrWuCOPCHPPymi4o8yzUN6JCXzLFAeo0TfC
	SyH+Yj8E7qlljdKGBHzD9CqQI+CSkn2E0YIMWp1IenW9BxSLdLsO8cZn
X-Gm-Gg: AYBFou1/VFus3cmXbYQGYa/hliTqbjVUxN23l3CI/0raYuwSNHBDpFAiSpXBDYbv70T
	YDvC1oKFLuHHC7VflLyKoZdUOBCFxb/pTbcKULo+l5SX0QXfMmnsmAIiLRJGYtVLu54jqryJk00
	ph7Ub4kO6qjDWuLP6lfNi4fR6KMh/TpOSLHOrDh7BL1KDIS4QCztfpnpEQzh4J/joPzVywGhHj3
	K4373TBWIhk9Q8kAks/VHRmMKKtmo7U82vzfi6K6yVMcw04f4WCvOra4r60bD18eOWKB31EjSe2
	mEIX+1kTOVLqXXtz1bTWPnfWB7ctMk7HJJU/ZC1aMOKxjURuXZMsJF/Ix2mmgQFZin/ePsoCqmA
	3Dt1i6UPRPRRRhkFI54CI5KQL1JKBHvlIwEbRjSE+iHIbxw5ldQM/+QUhY2h4o+YDr1YgnwL1Jw
	i+7Te9hr+by0L+bbyl1HdykPMoN//fcfiA48lWn5l5cOshZd826JI5FWDwGFckG9uxfqI+7atbC
	9UBmc3ntvVAkM67RHIdNJ/sB20m0EPgFM6cuZw=
X-Received: by 2002:a05:701b:2319:b0:151:2e62:fe8d with SMTP id a92af1059eb24-1851238b627mr6194268c88.9.1792304059620;
        Sat, 17 Oct 2026 23:14:19 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:297c:6f48:9e5:4e5b])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-183190aa411sm21099809c88.4.2026.10.17.23.14.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 23:14:18 -0700 (PDT)
Date: Sat, 17 Oct 2026 23:14:16 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Fabio Estevam <festevam@gmail.com>
Cc: lee@kernel.org, jic23@kernel.org, linux-input@vger.kernel.org, 
	mfd@lists.linux.dev, linux-iio@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH] mfd: mxs-lradc: Pass mapped IRQs to child devices
Message-ID: <atRjqcFvWVSSKKgX@google.com>
References: <20261018022400.599028-1-festevam@gmail.com>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261018022400.599028-1-festevam@gmail.com>

On Sat, Oct 17, 2026 at 11:24:00PM -0300, Fabio Estevam wrote:
> The MFD resource tables store indices into the parent DT interrupts
> property. Since the MFD core is given neither an IRQ domain nor a base,
> however, it exposes those indices to child devices as though they were
> Linux IRQ numbers.
> 
> The touchscreen interrupt is at DT index 0 on both supported SoCs.
> platform_get_irq_byname() therefore rejects its child resource with:
> 
>  0 is an invalid IRQ number
> 
> On current kernels it also returns -EINVAL, preventing the touchscreen
> driver from probing.
> 
> The child drivers try to map their resource values afterwards with
> irq_of_parse_and_map(), but the touchscreen driver never reaches that
> call for index 0. More generally, translating the parent firmware's IRQ
> indices does not belong in the child drivers, where platform IRQ
> resources are expected to contain mapped Linux IRQs already.
> 
> Have the MFD parent copy each resource template and resolve its IRQ
> indices with platform_get_irq() before registering the child. The child
> drivers can then request the mapped IRQs directly. Use per-device copies
> so later instances and reprobes still start with the DT indices.
> 
> Apply the same fix to the ADC child, which uses the same IRQ mapping
> scheme.
> 
> Tested on an i.MX28 EVK. The mxs-lradc-ts driver now probes
> successfully, and its interrupt counters increase when the screen is
> touched.
> 
> Cc: stable@vger.kernel.org
> Fixes: a85a6c86c25b ("driver core: platform: Clarify that IRQ 0 is invalid")
> Closes: https://lore.kernel.org/linux-input/CAOMZO5CgTzo6GuXptD4mFTN=UsJJqpkixDW1Q64gqZGrij8+uQ@mail.gmail.com/
> Signed-off-by: Fabio Estevam <festevam@gmail.com>
> ---
> This is a long-standing bug that I reported in 2020:
> https://lore.kernel.org/linux-input/CAOMZO5CgTzo6GuXptD4mFTN=UsJJqpkixDW1Q64gqZGrij8+uQ@mail.gmail.com/
> 
> This patch touches MFD, IIO, and Input. Since the IRQ mapping is moved
> into the MFD parent, I suggest merging it through the MFD tree, with
> acks from the IIO and Input maintainers.

Acked-by: Dmitry Torokhov <dmitry.torokhov@gmail.com> # for input

Thanks.

-- 
Dmitry
