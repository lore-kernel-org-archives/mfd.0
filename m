Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F29124399E6
	for <mfd@lists.linux.dev>; Mon, 10 Aug 2026 21:58:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786399107; cv=none; b=QN6wNDFlzr/VJM1jp0SZJnuONI4MVE53ALvwDv/Xfgp0jPgIbjEQ14AmNtsX68av0XMWsy8wo5vNPkG7dvA9b8vHivOvtwmUA+0ekj3bc9V/DX5p5n3yyuOq3BpMuU3DMbKvzkW7nFhiBRCH1SdMl/+sB6+y2yTiXzk/D6KdVrA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786399107; c=relaxed/simple;
	bh=NoSNnLeKVX6y1LedGuemlWhGAhmlreluV4Z+fWM0exU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=LhtffucvuHSHUYkj2GOKxtkEy0itxkEUCq8HO54QHKaY01/ryv6UTiklHk9plZwjaytNp+7pNzishxrRntTSnl3mxbIgdiDf8m/0t9mcEbdkYyoVCwXSdV6lTmCcA/qD/PGVmMpiwq5FQ/OLYcNjnra3MKXx89fUvT8naBqmBaQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=gMRYRKAx; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="gMRYRKAx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1786399105;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Qy1gE2gFEXUChO7E1GpI7tnTvfBOQiRyPrmqiAECFfg=;
	b=gMRYRKAxq5lbCXBo16FIAwfZF7uWE3ujcc5Ou86AzUg4Ik6PEw5rBGX/w+HRRZRFm7SJgD
	pCe/NOGSz9zwEjSJw7ohOGhcjHiInjulxOyAXpRyLzjAa3Ds5XxFug1eurjNxtYFXsfwZL
	0nlc7MCEXVlQZJRNteWrQM1nqXozaHM=
Received: from mail-yx1-f69.google.com (mail-yx1-f69.google.com
 [74.125.224.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-164-NpKVYpNLMVaXmwWmClQMGw-1; Mon, 10 Aug 2026 17:58:23 -0400
X-MC-Unique: NpKVYpNLMVaXmwWmClQMGw-1
X-Mimecast-MFC-AGG-ID: NpKVYpNLMVaXmwWmClQMGw_1786399103
Received: by mail-yx1-f69.google.com with SMTP id 956f58d0204a3-66988049306so2915136d50.1
        for <mfd@lists.linux.dev>; Mon, 10 Aug 2026 14:58:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786399103; x=1787003903;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:content-type:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Qy1gE2gFEXUChO7E1GpI7tnTvfBOQiRyPrmqiAECFfg=;
        b=eLoCFy2ouVmqrI/FiuNn0p1cLrmmxoVCrlhtwA9u5xUb+YC8CVI64h9FwBiB/1neuD
         6+vMPwaHc3+qTr/VMm8a6IsssGObrlERICtve0SS1HIUhmGBD1yZzW4D/z3hWTmEz8cq
         YXuQp3pEdVpqGO/dY6+DoQGp4YQUpoNpsVB8MD3CGcrA5l438io7sNnwDqJFqvaSo/gq
         RsJ5fxy1k2iiPfucH+Ze08xXg98O+3GNDHtj8irWQVYuVZdNtw15SGtc7TGPm6yFLniU
         dUMilovwqWAUhZ4+AbuKveMDfxcaftg4ujTrOLKxt8rDd1M8mNyhMd/Xu5coqZsOsPdR
         rMcQ==
X-Forwarded-Encrypted: i=1; AHgh+Rox2G5qryULyGeOqm1s4aaXDBwvpYKG7Ap9EJYYJRXZTAy1Y2la7SwprktDfTOpSb+pI+c=@lists.linux.dev
X-Gm-Message-State: AOJu0YzGJDXHAudX+8NNSAod0i4fwmfioXb9+B1HVaJ1PT0P1qOKyuk2
	iBTDmYMQ4yyjgGqic86AQztwtbNvYyJgoKojtEbigAF+GhVCBWtrCpUd+lbdapaCc5CN9twynTM
	bo4Ul+Mxnm6VCTNihjlLMtRWSIe8d6tKJ64CEqCVBq6eEiXZmkinylQ==
X-Gm-Gg: AR+sD13qcqsWRgrtNrr2dXONjHdULsL+Sas4KIrVsTsy/7TwO6P7MqGY6B19LbRXrLS
	HXHwIcY5YKlLu1xfwq3oENTCIGG+ADPlfaEyExJ6mH9+ECKEsRUZI4sZQkq0Zo+0y5olHBkV/CU
	cmSCDloOet/lolthfdsekEMe9a/xwPscip9oQ67f5CigM9vlQJE9OnN0X6T3Ltok2UUd2OcQXPO
	5i1JQMKs0bJiIIBHSTGZ59JCsNyadZC/QU22s6Purb0Tos/pfDcEHwcyEozmK2aXfakauelL4nt
	BokCsKNQSDEejlUHmPTeApuR0pqp9gTk48+6Jlxp5qUMl0jVn7LOrYEqg5VEdV/ou3AODW4ir8p
	5BdXbL/b7SKHPdrev68Sahi4/WSXUKjMHeS0=
X-Received: by 2002:a53:a48e:0:b0:669:113d:7183 with SMTP id 956f58d0204a3-66ac3016a1amr14341632d50.40.1786399102948;
        Mon, 10 Aug 2026 14:58:22 -0700 (PDT)
X-Received: by 2002:a53:a48e:0:b0:669:113d:7183 with SMTP id 956f58d0204a3-66ac3016a1amr14341602d50.40.1786399102538;
        Mon, 10 Aug 2026 14:58:22 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-66acae8584bsm7562472d50.10.2026.08.10.14.58.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 14:58:21 -0700 (PDT)
Date: Mon, 10 Aug 2026 17:58:19 -0400
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
Subject: Re: [PATCH v10 08/12] clk: zte: Introduce a driver for zx297520v3
 top clocks
Message-ID: <anpJe3-voStp-5Pw@redhat.com>
References: <20260810-zx29clk-v10-0-63846490712c@gmail.com>
 <20260810-zx29clk-v10-8-63846490712c@gmail.com>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20260810-zx29clk-v10-8-63846490712c@gmail.com>
User-Agent: Mutt/2.4.0 (2026-06-19)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: inkDSKqznYRv5cdLGW_gRFSwGvfUZoGenLBn-dMdwFE_1786399103
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Mon, Aug 10, 2026 at 12:28:27AM +0300, Stefan Dösinger wrote:
> This register space controls core devices: PLLs, the AHB bus, a lot of
> timers, the USB controller, the Cortex M0 processor that boots the board
> and a few other devices. For some reason the LTE coprocessor is also
> partially controlled by it. The main application processor and DDR
> memory are not found here though.
> 
> The register to reboot the board is found here, as well as a register to
> control whether watchdog expiries cause a board reset.
> 
> Signed-off-by: Stefan Dösinger <stefandoesinger@gmail.com>

Reviewed-by: Brian Masney <bmasney@redhat.com>

