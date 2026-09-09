Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CAB735CB61
	for <mfd@lists.linux.dev>; Wed,  9 Sep 2026 17:27:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788974822; cv=none; b=sEtYEhs1itDZwbA9DpwNIYl7TZliZ5y/6BnWlGC+UuCkrjXai1LQog6M1Vl/BNR0aWMImlyStn7pP+ymB0gUl5yBFoZMApqDP2P1RTNGeeoIkpezMCKoTiLi4xBel9ziXz2wosP9tJ6kJ2/H/zKykDgoaVsRWFhqRbTF7QRvNgM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788974822; c=relaxed/simple;
	bh=SUxP5gT1ZaOy4mmgP6chw0Cr8VRY83cgnbGtN/GeIrM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hZpiFL9XJLeQcRqSbIt3pkSSC4yZznebf4d3S3us26x8cxH/lgfptKJinl/3EQ1VoaLh6r/oENLMWib16KaZTPiCEzsvccpiQdkGPLhXx9yYm/SY9SrU1H6k404it/8kjdaDQh2cIQYHhRO5IY6wtKI4TKLX4L2dKBbo3FtTkKY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hBew0+6L; arc=none smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hBew0+6L"
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-cc4aa18f9afso421037a12.3
        for <mfd@lists.linux.dev>; Wed, 09 Sep 2026 10:27:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788974821; x=1789579621; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BxkJmMQiuFGLIVhYvP7iekSRoJyyqxrT2LFSLJP0a4Q=;
        b=hBew0+6LcALPWkoU9pPOcHLf/roFs+pcahVIuR2QMygL40EusUeizzo8jneADVPA2u
         IUMEqTsV4wTLHUmigXT8qlkpXr3g94O1fkhl0LfagqrteAXWGc0FXy4Ywzax+/vaXw/3
         zmc22PhK0LlbTHOkKVFGxwZNB6kIXzYgTsZfehVpxTL0jPL/DjJarBq+PEsu+II4ze8H
         fcN737xFw4Ihq+Hb8iGntniyjb/4Q4IhPHQ0VyQ+/nj1cK5ie0DOqskRWBn24T3dj2sJ
         y71mvySTIdsZF6n5zIfuVsW00kuCxaIpXb0rY+s+O+CtR4TbZzLyTcBa01HGZU1bjtjo
         X/ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788974821; x=1789579621;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BxkJmMQiuFGLIVhYvP7iekSRoJyyqxrT2LFSLJP0a4Q=;
        b=iaiUObzEyuK+okKvetMRJYRxzXFO0NnBpiP8+wBUgTE8jC/WxgHXaB34pKKReD0Dii
         Ri5X9rQyuQuSwI/tMG5et7SkH9ZFA4dEgV73yEwF/eSH9sFIbd/kZV7+c55Fu+xfuGyd
         rH5AlDujkuWKc8AlRLa8C9F+AYGNObMXy+vIC1jlj4EMCyoKmgRfx1nM21mVwEDNlBI3
         kn4h+4Dhcq/ChAXz5qZyMUVDnKe2Y7/KT5zPOSS+rH350KNMwcX/d5hBsB+mmRbom9Fo
         3VNGbl+TbkXqjx893Xxc1diTM8LW30MEsDqKzZdJ6+krm4c3BOU0zesAyaO6yv8W/0rp
         0T/w==
X-Forwarded-Encrypted: i=1; AKwUvBwgfXLn9NP3ZiScBHea/CPtxt6xP0qy6DbNTkJA757ZJOmFxMU6qlvr06HWTluCZQqliDQ=@lists.linux.dev
X-Gm-Message-State: AFuF++kAAK28nJfQxVDbUD5QGQ7ys6C9c2fLaEFtzj+XCCoi6KtTAi4I
	AlXapAqpxdtwcj4nomtnafQPWCOUDMMqCKLWZcUWtrtWygYlXBEoBg4+
X-Gm-Gg: AYBFou0uyBd7RuwayrjRvt/dYxfeas1D1M0aJhnAc4dItj4DnI/4AdsDh6RAEkPTlZf
	jKajD0FaxsJ/y+Mfvqof/7G43oopDY47wlqY1eM7fZEg2eTaaICFxNO1QLrwd6Uv1PMhbWrnjRX
	I0S1Pl5qBtMK3f8S16UMZzq0OBWGpEI3q6Etk9JmKH15/bTOCmE1HyVQ3F3JlB7v+MsSzpHILes
	yvNh7zHLpUZ7m6W/sOyFay+IkzpMx2Uh4vgnWISw2I3U9pyaed1viezgutuknvb84BpcI6Y0pBQ
	fPAIyyQdDVGJjPT1T1oRmz/L6kBp9pVwedXJoW9DCtzzLyaB/OvMGItU/PL8GbucKoj7oK59+sO
	shK1FAz4Ul+RdRrivlq9SRAb13moIC2/YtJ32Gil8FHiC9EPWIO4CvBrZiexr262Yn9e9hp4vla
	aIQ+mO2uwMRwysC40h6tcz/bppulGjpfK1FVoO0uce2aVSmPhQ7G2eem2J369KalayXy68OVl/T
	zG5PHgfhS1GWlwsL7yslOj5UgzKU5+pJrJAbc8fw3Er9RWCGIxk
X-Received: by 2002:a05:6a21:9d84:b0:3d3:af85:eb98 with SMTP id adf61e73a8af0-3da3a16a579mr57975715637.26.1788974820346;
        Wed, 09 Sep 2026 10:27:00 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:2d43:5153:5c50:643e])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339a534df1sm52422943eec.7.2026.09.09.10.26.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 10:26:59 -0700 (PDT)
Date: Wed, 9 Sep 2026 10:26:55 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Lee Jones <lee@kernel.org>, mfd@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Arnd Bergmann <arnd@arndb.de>, Daniel Thompson <danielt@kernel.org>, 
	Jingoo Han <jingoohan1@gmail.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Guenter Roeck <linux@roeck-us.net>, Linus Walleij <linusw@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, Jonathan Cameron <jic23@kernel.org>, 
	Pavel Machek <pavel@kernel.org>, Michael Hennerich <michael.hennerich@analog.com>, 
	Support Opensource <support.opensource@diasemi.com>, Sebastian Reichel <sre@kernel.org>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Helge Deller <deller@gmx.de>, dri-devel@lists.freedesktop.org, 
	linux-doc@vger.kernel.org, linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-hwmon@vger.kernel.org, patches@opensource.cirrus.com, linux-watchdog@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-iio@vger.kernel.org, linux-input@vger.kernel.org, 
	linux-leds@vger.kernel.org, linux-pm@vger.kernel.org, linux-rtc@vger.kernel.org, 
	linux-fbdev@vger.kernel.org, linux-sound@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	llvm@lists.linux.dev
Subject: Re: [PATCH 00/14] mfd: unused driver purge
Message-ID: <aqGWjAuGXq_JHvxk@google.com>
References: <20260909132153.1596191-1-arnd@kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260909132153.1596191-1-arnd@kernel.org>

On Wed, Sep 09, 2026 at 03:21:37PM +0200, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> As part of my cleanup of old platforms, I had a look at all drivers that
> may have become unused because the last platform_data or DT definition
> was removed, or because of unmet Kconfig dependencies.
> 
> These are all the mfd drivers I found. The first ten in the list
> actually turned out to have been unusable long before my series, and
> I have added explanations on how I determined this in each patch. The
> last four patches are still in use in linux-7.3 but become unused after
> my series [1] that I hope to get merged for 7.4.
> 
> Somewhat unorthodox, I took a shortcut here and remove both the mfd drivers
> and the corresponding subsystem drivers (gpio, hwmon, iio, input, led,
> media, power, regulator, rtc, video, watchdog, asoc) in a combined patch,
> to simplify the interdependencies: removing just the mfd driver would
> leave unselectable or broken drivers in other subsystems.  I also have
> additional patches for each of the other subsystems, currently a total
> of 300 patches, many of which still need better testing or proper
> changelog texts.
> 
> Please let me know if you all think this approach is ok, or if I should
> explode this further and turn these 14 patches into 70 individual ones
> by splitting them per subsystem.

Sounds good to me, especially if Lee makes an immutable branch from this
pull so we can all pull it in...

Acked-by: Dmitry Torokhov <dmitry.torokhov@gmail.com> # for input

Thanks.

-- 
Dmitry
