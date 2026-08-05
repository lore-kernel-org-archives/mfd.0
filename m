Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B39C3D331D
	for <mfd@lists.linux.dev>; Wed,  5 Aug 2026 23:15:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785971717; cv=none; b=EA/rNEQWh1/U/eoLeeOF/rP73EQaO/Ch0MTJ/LEhkPkIpnRMk0CRDnFSjY/D7M+PttD0FxqhGYwODIUP6C6pyt8jCbmDeSJrIP0TCAQ/He3PYgF+g+hIIRfLIJ7ZZjNpPJwO/nGa+S06RywKq1blCAyKb1LCwuB3q0w0/aIR+jY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785971717; c=relaxed/simple;
	bh=pPy1CLEmf7LQ7+VRVpU1PtPWWfqP1ERTf8ceNSl1ajA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=TaFfsuWzhvlWu/iip91m/txwMaDmwsJthOtJXvq2dgCq35GXJeeR6iuu361S2nDTYVTsvX98tPYCDVzgr4HYjiseY4wdzMX63GWbfTmENaf5MULCN+zcLpn2SMyvfOszzeQ42m60fyPw56EXmtKu+JGHW7At05DFTIOIvPi5Tqs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=bGOv+2nZ; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="bGOv+2nZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1785971715;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jX93A5wJoAu0JKunu6l9UvEvI322kw4iodDAJblYaVI=;
	b=bGOv+2nZ6eOEFgRcPv93GN6AYwQsyZ1R4fLv5ewGs+1+DKzTdkBfPFzyoIZRuK5Zs1VDSx
	b8e60g5f7bCzkmGFzxXKmLdBqn9ZmPCQzRMP1Zztm+0o2DEPeBeHr8Gekg7OKzwXJT1wsZ
	/cmj/iNtloHT5AO8dU0sk0g+jwq7ybg=
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com
 [209.85.128.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-442-JVIqrf6rNf2UBsizysDyVQ-1; Wed, 05 Aug 2026 19:15:08 -0400
X-MC-Unique: JVIqrf6rNf2UBsizysDyVQ-1
X-Mimecast-MFC-AGG-ID: JVIqrf6rNf2UBsizysDyVQ_1785971708
Received: by mail-yw1-f197.google.com with SMTP id 00721157ae682-81f0b6bb02dso41459797b3.3
        for <mfd@lists.linux.dev>; Wed, 05 Aug 2026 16:15:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785971708; x=1786576508;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:content-type:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=jX93A5wJoAu0JKunu6l9UvEvI322kw4iodDAJblYaVI=;
        b=AYjybT7lGxUGb0kiT07u7FlAuMmMLTAeNxoqjYlMIKaS7gDc8ZnDCoQumE1xEa35f1
         4TjjHfnx45HcJ47sUxl9xxt9++MKdf4jvvXgiL1mcx+06F5C2pX6g9+xLD/uLPCG6jCy
         OFInPEa8INKj1D9z6h4purJ8n/j0TWw2rMaGOuJG1rvSWjueqlYkxT8kNU7zPSbSEJCA
         Kpa/edalAgTrIC/NBiCrkI3dHAgvn1oD3FRTpTnSqDDzs8kokUNxTvPhEK289N2IKopz
         jYZ6eZQwRfwwtDE1UcTwV5UIxj6PtAbqQxF2LW66Yme9oM627cJs2m8K09k0KFBWvZZC
         /7oA==
X-Forwarded-Encrypted: i=1; AHgh+Rqc29sgxsniTpvocLLQt6J8caqNpR3Mm1SISzf5CkWVy+g+N1Q8rULyOrEKLgf2BZ6jevc=@lists.linux.dev
X-Gm-Message-State: AOJu0Ywt7MgL1qQyTmhnzxGAc/3IOBpsT6iRu6d72PK7HLQ2QnFRl+85
	JqawP1Z7za5Y0Mi3xRSgxfCqenE72ZuDUnPBIS0M0TZsxrPEAX95SNEHLTBWT3NfQk0zO3uMYB9
	efRtwS6a9FBorReAkGkyX/7SaIzQoSrDcxNM2RjgrvQMDtLNnDkwVRg==
X-Gm-Gg: AR+sD13PcELaje+4LMvrW+Ygn+fyclurijeAxgsU0zS/pUbZx+xIw3MsS7HV5HNShgb
	hThYA1si83/sDHRzqgOZkh9kYzkFVg3f5SoNHqntgRBv/Whr+0gmmRUMvbQFgZA6o5F8okoIEgS
	+0ixW2JJ7WnJPj3LOINs7GOAIipDgyjHsrODgmuXddPKsDDnBltEVvzpq80tvCys1sLoLbyyN41
	/s1uWo9EAc2la8zxFgZI841931kyk8u2RoLWN1WtyQ7WIvmX6jlDALgsltAr2C20LtnNgUcYeHl
	aHxn3ITf3neMuqwWopjx0EgVGna2/EVpFrDJqGVUsbvJgCfB51ZDqEUOCZ62TOL8n/0Eb6zoK2y
	J239SX/7eGTR+lYtGMBz+iaJqN9VExuNGcfM=
X-Received: by 2002:a05:690c:4882:b0:80d:c9d9:e1a9 with SMTP id 00721157ae682-820229a0978mr60602537b3.27.1785971708343;
        Wed, 05 Aug 2026 16:15:08 -0700 (PDT)
X-Received: by 2002:a05:690c:4882:b0:80d:c9d9:e1a9 with SMTP id 00721157ae682-820229a0978mr60601867b3.27.1785971707809;
        Wed, 05 Aug 2026 16:15:07 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-820134a9e21sm29018917b3.42.2026.08.05.16.15.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2026 16:15:07 -0700 (PDT)
Date: Wed, 5 Aug 2026 19:15:04 -0400
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
Subject: Re: [PATCH v9 05/12] clk: zte: Add Clock registration infrastructure
Message-ID: <anPD-I9GDyOZSDO7@redhat.com>
References: <20260802-zx29clk-v9-0-d05530d85d28@gmail.com>
 <20260802-zx29clk-v9-5-d05530d85d28@gmail.com>
 <anC72Cf1zKcLYWlC@redhat.com>
 <ky2t5IqOTfWMdfZsXE91Gg@gmail.com>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <ky2t5IqOTfWMdfZsXE91Gg@gmail.com>
User-Agent: Mutt/2.4.0 (2026-06-19)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: VRk510Ov_rxsn652GsimxpMP0a8X2-N3IO5Y8pkq0r8_1785971708
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Hi Stefan,

On Mon, Aug 03, 2026 at 08:48:18PM +0300, Stefan Dösinger wrote:
> I have a long-standing question about tristate/module support for drivers like 
> this: I don't think the driver can realistically be unloaded. I have been 
> testing driver unloading by removing the UART clocks from the DT (otherwise 
> the clock driver is busy) and marking all clocks critical (otherwise 
> unloading/unbinding will shut down the UART (and more) and lock me out of the 
> system).
> 
> I have made it tristate because from early research into clock driver state of 
> the art I gathered it was desired, even for drivers necessary for fundamental 
> operation [0]. Did I understand this correctly? It also uncovered some linking 
> errors that weren't obvious when compiling the driver into the kernel.

Leave it as a tristate since that's how most clk drivers are built. Also
think about this from the standpoint from the perspective of a generic
distro like Fedora or Debian. Support for lots of SoCs will be enabled
in the kernel configuration. Some SoCs that may be deemed to be not as
popular for that distro may have their clk drivers compiled as modules.
(We at least do that in Fedora -- can't speak to Debian.) That way they
are available if needed, however the generic kernel image doesn't have
a huge number of built in clk drivers. Some more popular SoCs where the
distro may run will have these drivers set to built in to help with boot
speed.

Brian

