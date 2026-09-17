Received: from mail-oi2-f0.google.com (mail-oi2-f0.google.com [74.125.231.192])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F53F49B458
	for <mfd@lists.linux.dev>; Thu, 17 Sep 2026 21:06:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.192
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789679210; cv=none; b=Mij7tzY6NRZjM6IvdzVym6XQmNCaWCbW9mi0UxEK+6u3x0W+NrTgyzZ7qC7OfRNM/Y9af0cDDKNDDsbfIcS3VETGXgSjT6CPL03yYOZf0j85FARyVkqQ+HZTYzVDVx5nuXzVQCw0xzQziira2+4l3ivPlEkJDaBEhwnot48mkow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789679210; c=relaxed/simple;
	bh=HvdkJ/FnzyzxhIRWpbHKeoBcBq03AZPrsWZYmOz5CAs=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=fgE3idMvSHTHzMicMlC4xuYACv42ZybwfHRntp5ggN8yl0m5cXLGr78jcHQg1lup86HeG2dndyZsTJDPwerkcljs8yktaU7cm0biZcUzbkFLZVDvNrAaUN9g/7DljUSexhLxyx3q4djPvrne5/9fLWMgwKbBZkcuw+VyHcRoxUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OEkA6xAb; arc=none smtp.client-ip=74.125.231.192
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OEkA6xAb"
Received: by mail-oi2-f0.google.com with SMTP id 5614622812f47-4a4492f5cd1so20278b6e.1
        for <mfd@lists.linux.dev>; Thu, 17 Sep 2026 14:06:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789679207; x=1790284007; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=UhGqQvEgqcceDfwacv9AFFFJVljDY2FHfHQZ/xmKpow=;
        b=OEkA6xAb2nzoqvAvGDSMuAYjUcdGWRauEIPU5Q87R55R1/zsPQ7VcI30lSluMNRB9h
         /8AIbcnx7egYls4dxzm7VYt25buRsfadSqUX9pmeY3WKKsFcqdD/Yvl8lQUot/FbIPL0
         uXXGnmAJtsL8kxyBBrkkp6+c3yxQrJ1LbE3tkKQUTm+534ZkF/USogi+LlgKonmNHCX3
         ZrY/41ncfZfVTOn8y2FTn9lWY6RctUKN/yVA/xuYczVytFUNMknGa8JfZFCdz8fencj8
         aRnOpVtK6DtQPpWP+MF/cMpj7I3ofrqc95scYxEPMZJ/Eiq7qmt5pV8MLuxslxsxl2ti
         2S2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789679207; x=1790284007;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UhGqQvEgqcceDfwacv9AFFFJVljDY2FHfHQZ/xmKpow=;
        b=zW4EN+pWdOZ1upxtUUFSvLF4jCde8lL4jR1/SxmByE/mwB9/Qf3IgDWBxKr+ZRKhKk
         C/oAL3x67jkReSDLHdWH2YVWVqoCJ54NLiOQPg9x36xR67IlrjOwuXRashiQCPTcQfgC
         7YmDCiPCuxXOFkBwT9Rv2aeffjt+tCo+TxNpotHuWmy+uHrktszl2l8WKFqjbf/SgHNm
         gOgRU/RElwLY4xXe2mQzAiUnQETKYc+JZ9kaAYJ0iMtrBxFhBsa5GLwsVAyFZTGCtvxC
         TktY6rNaD3X0NNnK9ef+cnEFw+XqCSVfG6Hvo77RtyRehfFLgYczTVivBbzCwKcQZx1/
         VCxA==
X-Forwarded-Encrypted: i=1; AKwUvBw/22TrjrI9DSIZORYEBAHVJjV6dVHNsLo+lvChGmqX8cZX4SnjLvorHVH1aDXjeKk5yl8=@lists.linux.dev
X-Gm-Message-State: AFuF++lTB0uR91/tdbwLxrCAvLNIiFi1fI3uW6HDEfmzfok9M8GVK9ZE
	dkWwtCSUVekUAY80m/U5pXGApQC+MD19+wO1S1wn+D9DjAfY2epybI28
X-Gm-Gg: AYBFou0HSmgIKtThwBBFbIKaf9K/qzns2KCKIFVZ+IdagTYdVOmSPEDSllrnGznbb6A
	o7k9te0A4dKzSaBc6Ob6WXjOKGVPyj4cTvqPbVCiq2G/PkDPlXARwgvzJcdcQzJCv/Vt3cmeY5B
	AOsVNKhK7nAErUVd9Csyj+hQVhgPHQMIrtU4pSYbGod1VNTPaI3SSLMH+F2DpoOTjExHIC/0u5C
	hB+vbeWZTfFiJxp0xCxHEyjF/5iaKAkD5UcxweBZ85jqFHJW7oEF03vXPa70iKlpRHj+Fn5q50y
	DSWq4+/YiW9bCYkB21WygguRGcxvF94puw3rxdVzazfJpWzanbhz2Aq0W06aBxAJ2zIgPmcG/tP
	8LMHvgrTPrj0I0yEyZEAy2EodixzuOatiqkVejhLKnagXWvGKGliCGkiar6RVKbgqB1kwMcVruj
	N2TnjbVJ1Csldm2+4/UaWxy8oeyx+GGphuAJF/3E0JKSRBx7bhpd5nttVn7RNLLUqqy/b3/L3II
	cdAY9uMMqIGbVM=
X-Received: by 2002:a05:6808:c175:b0:49b:33c8:4b75 with SMTP id 5614622812f47-4ccf6a67699mr616748b6e.5.1789679207257;
        Thu, 17 Sep 2026 14:06:47 -0700 (PDT)
Received: from ?IPV6:2600:8804:5716:d800::b712? ([2600:8804:5716:d800::b712])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4cb6cd41d0asm3431836b6e.10.2026.09.17.14.06.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Sep 2026 14:06:45 -0700 (PDT)
Message-ID: <bc93ea43-0650-4a3f-919d-6e0272d24073@gmail.com>
Date: Thu, 17 Sep 2026 16:06:43 -0500
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] iio: adc: mt6397-auxadc: add mt6397 PMIC AUXADC
 driver
From: Ryan Brue <ryanbrue.dev@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Jonathan Cameron <jic23@kernel.org>, David Lechner
 <dlechner@baylibre.com>, =?UTF-8?Q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
 Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Lee Jones <lee@kernel.org>, linux-iio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 mfd@lists.linux.dev, Roman Vivchar <rva333@protonmail.com>,
 Luca Leonardo Scorcia <l.scorcia@gmail.com>
References: <20260915-rbrue-suez-upstreaming-mt6397-auxadc-v1-0-d35d2ac3d6f0@gmail.com>
 <20260915-rbrue-suez-upstreaming-mt6397-auxadc-v1-2-d35d2ac3d6f0@gmail.com>
 <aqpnpT6hU5Z0s1TZ@ashevche-desk.local>
 <71a6ed12-f089-404a-85ec-546e03b4db3e@gmail.com>
Content-Language: en-US
In-Reply-To: <71a6ed12-f089-404a-85ec-546e03b4db3e@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 9/17/26 4:01 PM, Ryan Brue wrote:
> On 9/16/26 4:55 AM, Andy Shevchenko wrote:
>> Why not add this device support into that driver?
> Please see [1].
>
My apologies for double-replying, I forgot my link here.

[1] 
https://lore.kernel.org/all/2d1b80f2-53f6-4ed6-81bf-e35c0a9efb26@gmail.com/

Best regards,
Ryan
