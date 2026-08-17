Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DB9A3ECBCF
	for <mfd@lists.linux.dev>; Mon, 17 Aug 2026 09:39:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786959584; cv=none; b=IXm3Kw3+2GG871m28ZgvlVUI7EOKLoz93JTQKYwd1dBIXXsPoL5mUmXmEbTACJHkeOf179DPOva/+kGWPySGrh/HD0AdbNbjfACAVdqiSEctvMdvNQRHvBNKCzSNyOE88+YWoDyK8VpFJme605ohehsQIr26sp106sBrGHjH0Lc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786959584; c=relaxed/simple;
	bh=dtk6e7DXkab0Wi6uKJ4HjHzWIAKxI0jK8NztSrr+wKk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=u4P7CqSvs/He3BTf+Ajxl4sZ57/dz6BFR+Ft3TLfUhtz4UEH9A/wsAINNgJndSagbWHtKrnDT7RSX1cZRC3Dm5nw9xweORYd+WNLvRR1QvUWlzJCOEMBciZ2TOKm+U6UJERXGEHsXPorSWJn7I1LhZRP/mgdIBFCpiYsw7rXbaI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=d2LdK0q9; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="d2LdK0q9"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4921eed3fa2so25569795e9.0
        for <mfd@lists.linux.dev>; Mon, 17 Aug 2026 02:39:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1786959579; x=1787564379; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dtk6e7DXkab0Wi6uKJ4HjHzWIAKxI0jK8NztSrr+wKk=;
        b=d2LdK0q9Cc0arE4J1pBwdCcczfoWNMw+FKkMuyR9vlSNI+Kuiyxn7q/chTjkAAG2EK
         vMh+jlgU8DI4I1sRRh+R4QxEnmXqiYnTDdpxCX79w+/oPu1LA1B+TNfU8u+VGhUOZEqm
         RpMrVdfCLbc8q/JansSVaEa2SOU+DPIaz1xjFys7kNbIGlR/oVyZ0/1DpDueO3iAx7sz
         BhxL0tKx9CmEAcL3AOQxGDXmaEw0X049ZAo0j+CwKesi3Di7f/dd5HLeqtbP0JHASjNQ
         WhW82z9LqyeezzGDFKPC+qenZe2nymwoD9eG9YbEGOu3lOGhQd/mrV3PyvGgAdWd2ufi
         5SAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786959579; x=1787564379;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dtk6e7DXkab0Wi6uKJ4HjHzWIAKxI0jK8NztSrr+wKk=;
        b=Ovor2oAAtjw1r/0tlWXMliVzUbl/3+25JLvGI3BIrM6m4hJAGEEXKvILaiodxMz030
         7+krc3wLvpjS/u9wP4VSAIToyDfI/AvqzUrESbrOXddDm1hhOf4slSwCh7PTuMXdxeq/
         NsD4ijB+HawRTLX8oruc652TtUTBnW1MSsFXMRM1nvpr5WDKhQ73UkL+M1zCRo8eILU5
         mFZzf8udlLkSeqwdQm1szVX4sL6XKByjFQeTYeNaNLb9aFxtwcpXV5ugyEKgFL3K9xvl
         gfeyq+9jECJU43fAQrQrlJgqQ70ozlhXjadGQqsSkAxT/x2luhcNBXtiGqpaV9o3gEBV
         XR9A==
X-Forwarded-Encrypted: i=1; AHgh+Rr5wvs+DjHgvMYfB+/UOoF9az5Seq0fM07MfgPhT+WaSAuzluXgTe9HrYPCNF15D+F9dW8=@lists.linux.dev
X-Gm-Message-State: AOJu0Ywil/jP85YvG27ew183xOK9r0l3wHUzwZS9QqYQp0rb+JfEYBuz
	dWMfX8vTz3VV/uM+18YzfmMjiQDqRBApAORBny/jUp/1TdVKxT6+qEzABTLau4uyZTw=
X-Gm-Gg: AR+sD11oK/N4UrByDMiZHEnl8pwRsE9aPsir7zCo5y/EmrO5MwAsolcDLwKvu+rv1YV
	sIqIM44ntOBmeZHbJiin7JKLhHqbO4mZ/tb1vUb/Y6NBdq2j+XunkF0iV+uCmvS5T7wr/SKyFMt
	2LJvsRqW4DEew6XItZpPQ+Xg+H50UFL3v07iYxmxDgpm2BS66Exno3GmVbr46kN2Hq7o2yDeQuT
	mVfsOigg8xT9i834gBIahJPMTvqT1JZ7N//kO6KHnzUCzeql6vLzWNXrFkVs7B04FhiK55mKPPh
	dcw9rphD0yY2Sj2qH47sDSRzdl9eP2aWE0HOOTMW/rh0z7E/tyvp+20w4TcupAkTyA2D6XJifML
	kW31QS7H/0/wLWcNuvCZm19J+Mw+TfdLI1FGOjQkXBJz6EB72i8YQaYFIa/hRPkwny89oxvU8zI
	uL3Ebfz47lmVsNS1djl1YLEHCNSPDAShe/o6fXnBVWKRmzyCOKGVvXCNRDtFganEeIqX9NH2T+f
	ZWZgln6MlW0lgW+rtbtyYY+GSKZ+8dmYC0w9bVBJYBJaMJ9wc98hvBJkyIPnA7VArBzJy1U202G
	MEFqXygH5PthFm2sIcUVZhCmggSedCVF+q4F8dqw5/ESKQ==
X-Received: by 2002:a05:600c:4f12:b0:499:491e:4b0d with SMTP id 5b1f17b1804b1-499879c627bmr387093535e9.19.1786959579385;
        Mon, 17 Aug 2026 02:39:39 -0700 (PDT)
Received: from aspen.lan (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4999610ed6dsm169142985e9.8.2026.08.17.02.39.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2026 02:39:38 -0700 (PDT)
Date: Mon, 17 Aug 2026 10:39:36 +0100
From: Daniel Thompson <daniel@riscstar.com>
To: Jonathan Cameron <jic23@kernel.org>
Cc: Svyatoslav Ryhel <clamor95@gmail.com>, Lee Jones <lee@kernel.org>,
	Daniel Thompson <danielt@kernel.org>,
	Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>, Helge Deller <deller@gmx.de>,
	Johan Hovold <johan@kernel.org>, dri-devel@lists.freedesktop.org,
	linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-iio@vger.kernel.org,
	mfd@lists.linux.dev, linux-fbdev@vger.kernel.org
Subject: Re: [PATCH v6 04/14] mfd: lm3533: Pass only regmap and light sensor
 presence to child devices
Message-ID: <aoLW2Lo7LDD-OcWF@aspen.lan>
References: <20260731113632.158440-1-clamor95@gmail.com>
 <20260731113632.158440-5-clamor95@gmail.com>
 <20260815025203.2618cf8f@jic23-huawei>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260815025203.2618cf8f@jic23-huawei>

On Sat, Aug 15, 2026 at 02:52:03AM +0100, Jonathan Cameron wrote:
> On Fri, 31 Jul 2026 14:36:22 +0300
> Svyatoslav Ryhel <clamor95@gmail.com> wrote:
>
> > Instead of passing the entire lm3533 core data structure, only pass the
> > regmap and the light sensor presence flag to child devices.
> >
> > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> Acked-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com> #for-iio
> (I didn't read the rest on this one)

... and it looks like I overlooked that there were backlight changes in
this one:
Reviewed-by: Daniel Thompson (RISCstar) <danielt@kernel.org> #for-backlight


Daniel.
