Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0CB1437101
	for <mfd@lists.linux.dev>; Mon, 10 Aug 2026 21:59:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786399149; cv=none; b=rzPbQ4yfSlAIvzmZhmf9taqQOnstyGnhHXaLShk30kK/LAujb2f6+H5g2xq+n5XxFLmTlD33Ntr/QwRBdWUCI33ZpMp4rm1V+dfpNZinyW1G8574LNf2OV54kJTB7zMNGHt5FAzFrVRdCKsHzBuucf2Rjp/8bbWQ4TAvqXyD1Us=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786399149; c=relaxed/simple;
	bh=f8/4j/TRgSENYcqClLBb0UBt6QQ2qJIY3W8vGPNaE58=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=TA9fOvHYx48lanEZzafzPgYeWmCdPqJQ518FXWZ+2S3rosxJkJBmuAPa8PEr7OzjXpeP5cZUcU83b4IA5Axn1+OZobZEf6LF3RB+cCxtrPJx3LqB5TN2tn6ELeHOgcGhjrj39nk9KpCaXXDLC/T+X8NpnIC/Ds6UXsnWkm2V4QE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=i9ZtFrot; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="i9ZtFrot"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1786399146;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=c9CDIauTN7m7q0Q33ff28ouhlrdSOd1kpngNZO2bxk8=;
	b=i9ZtFrot7tEAlJk5CC/ALHFhvjxsRb29kRTTxNwljh4qB1OBP8KuAYXqVMsIXrwPDZUt+J
	7q3YSgrOyzXzb8GWMm+2GHFTLIWpHY7m7P7Zl3HqR3tHg1B2hxfk1jf/+OcTvwq1RThhUX
	9hn/U1ClvB9S3EQWgP0Q6+rzCMk6tkg=
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com
 [209.85.128.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-64-KZHqB35HPjWK3Col2hChuQ-1; Mon, 10 Aug 2026 17:59:05 -0400
X-MC-Unique: KZHqB35HPjWK3Col2hChuQ-1
X-Mimecast-MFC-AGG-ID: KZHqB35HPjWK3Col2hChuQ_1786399145
Received: by mail-yw1-f199.google.com with SMTP id 00721157ae682-81e6abfca68so50409867b3.1
        for <mfd@lists.linux.dev>; Mon, 10 Aug 2026 14:59:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786399145; x=1787003945;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:content-type:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=c9CDIauTN7m7q0Q33ff28ouhlrdSOd1kpngNZO2bxk8=;
        b=IC5mlc0irohhLqubfXdL85ZpsHI6a5zxBlA47eJGsBuvxLSzBP1gJEYRvoWY+UaJBU
         4a0Q61dq0fHzeT8zsw2e0t10ImCXr20OO9dHDqymf/adFvgTIF3gtrvyVisTfrk9sX94
         eyIfp5EHMY0HS91bLD6gc1KyeAvIHym7Uw0eK+bUZMKX2eWWPH+Cdp2Etol6UwvyHTL1
         FM84gIytLO+6B2G1yomML7xCQZEa7Q3OZ4YDLdxc4GRqgJHhkmDSfqZoRKdTv/SEcVJ5
         l86c3AyZW7D+HtmbJ0UERI7uwk8ym9oaK2XyEiOCfcnoeDe+dYydREzWRIWMx7QPwry/
         IoOA==
X-Forwarded-Encrypted: i=1; AHgh+RqCHbLKklXq51lFoOSanZ2+YKMX5vuT2F4WiIe0J7oJr2ZswJs/CI2UZGa1vMQwh3t78cY=@lists.linux.dev
X-Gm-Message-State: AOJu0YzsqHDDNReN1oRkf14uhRJ9LOadRxcfTWZlPqYXYSYTarMFt0xY
	AIuzFtsit7MaH2HELVstonhTNAUeVyMyHHnNyfY/ZAhVCM6tVaA8UzPJPzHhWpsv5Niyd4d5TvH
	po2/bnYPvfqKlyFj+jq8gjOayC1qQYIDfA3V21RXEgVb4+XD/xmTM0A==
X-Gm-Gg: AR+sD10bKa837qGU2waBng+GVNgNDVUJ7irzUvjc+z7JQeA81MzbyYwmm1v2Rj8vFlL
	lgtgKD5DV/sdPH2t/qqrvQQiAIWU111czhDmFB/HfPuka1zLd3qM4BRW+QkuHRTZQCzEd+Wkcyv
	dv6R262ck2ClC2Oua7ggmRxjvTfxCSjbTZCDfZdCYMTr5Xpwutj+cCvbzeEk4k0vs5fjG/BJoJT
	4seGRPqayYlERfgx8/+9O/GvaD9xZSKBJE5o/kCARU47zui2Y/WfNdn/ustxzgATrmAEYa+fA6R
	QUrCFuVfZp1PdFZ+/JPAekTZsEmGmp/TgIMOIfa86Dv9LpQCxXQ2Pdp3Eek2fb0LzIITDggmrYE
	Y7KQm3PdZMCk+6kh+iu7xVB1N0m+YBIH9EYE=
X-Received: by 2002:a05:690e:128d:b0:667:b825:8543 with SMTP id 956f58d0204a3-66b12527c19mr2793250d50.49.1786399145047;
        Mon, 10 Aug 2026 14:59:05 -0700 (PDT)
X-Received: by 2002:a05:690e:128d:b0:667:b825:8543 with SMTP id 956f58d0204a3-66b12527c19mr2793223d50.49.1786399144641;
        Mon, 10 Aug 2026 14:59:04 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-66acae8584bsm7563368d50.10.2026.08.10.14.59.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 14:59:04 -0700 (PDT)
Date: Mon, 10 Aug 2026 17:59:01 -0400
From: Brian Masney <bmasney@redhat.com>
To: Stefan =?iso-8859-1?Q?D=F6singer?= <stefandoesinger@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Russell King <linux@armlinux.org.uk>, Lee Jones <lee@kernel.org>,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-phy@lists.infradead.org, mfd@lists.linux.dev
Subject: Re: [PATCH v10 09/12] clk: zte: Introduce a driver for zx297520v3
 matrix clocks
Message-ID: <anpJpQgo--a43EdA@redhat.com>
References: <20260810-zx29clk-v10-0-63846490712c@gmail.com>
 <20260810-zx29clk-v10-9-63846490712c@gmail.com>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20260810-zx29clk-v10-9-63846490712c@gmail.com>
User-Agent: Mutt/2.4.0 (2026-06-19)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: JJGfhcxP6j7ZLjZOTK8mLTw7gxQvJNzXH3G42DLaNds_1786399145
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Mon, Aug 10, 2026 at 12:28:28AM +0300, Stefan Dösinger wrote:
> This clock controller controls high speed devices: CPU, DMA, RAM, SDIO,
> Ethernet. The only non-clock, non-reset registers I have spotted here
> are hardware spinlocks.
> 
> Signed-off-by: Stefan Dösinger <stefandoesinger@gmail.com>

Reviewed-by: Brian Masney <bmasney@redhat.com>

