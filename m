Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 606E3395ADB
	for <mfd@lists.linux.dev>; Thu, 30 Jul 2026 17:38:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785433097; cv=none; b=NuuzXRBjLVeGlIZoTYPd4h7BP8MwzfniAQIZrJjAzDqtv7ICgcpM+qi5qq5Tu3TABMA+Oghtk9hXYuRYTeRIX8nRJN+24q+9CPmST81E7XReKVhoJTDiughvdn1YBNJW49yZncnL7kr9VT4ChZQT6902kPFHPtqVXi4FBftbkbQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785433097; c=relaxed/simple;
	bh=tcCAaJdWJcVjCNXkGXLQhu11kXbWbdF1H1Q7waoPhQI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=Gw3abwoNJDC3/PKEj6N+pCvFWzTAig6KmrR/22hpegtWKX9LYUJS6DA9LKSfePFq3CpUdYdUd4tqFUCNWg5yzUgoLVWkSlECrkPHut/O6iQRT0qizJsAtUiXPwoUCY30akYV2ZUegdCzPEspMFUitBPQfa9FSO+HljNJ/qV0w4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=dCkxqSXq; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="dCkxqSXq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1785433095;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PRVLUAMqt9btSYcKLPYN+Dg017FHNaeUxumso8uAL/U=;
	b=dCkxqSXqqJL4mE6nhO57kWbmJh4GPGTgT0Nm/Fq9ho0kJnwcrU1m+QBBDDG01r+kKyxtZc
	5o1PnHUKvaRTPVK//7j7IK3s2FbJf93p3hLlBXoYyfgRkheCp5vNd+/eKFv2Yb0VBJ/bKH
	cytgUXkfE+u5odefvuwxUPkma2r84bA=
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com
 [209.85.128.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-251-ZHylQd2tPU-PVQWREqQNCg-1; Thu, 30 Jul 2026 13:38:12 -0400
X-MC-Unique: ZHylQd2tPU-PVQWREqQNCg-1
X-Mimecast-MFC-AGG-ID: ZHylQd2tPU-PVQWREqQNCg_1785433092
Received: by mail-yw1-f200.google.com with SMTP id 00721157ae682-81eddfe28b4so2433017b3.3
        for <mfd@lists.linux.dev>; Thu, 30 Jul 2026 10:38:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785433092; x=1786037892;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:content-type:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=PRVLUAMqt9btSYcKLPYN+Dg017FHNaeUxumso8uAL/U=;
        b=fJV05On4CqI2LcTYcYh1PlSkanq6pEpLMQ8WVTBWWpnxzTqasShVWO2dCqOoEnaqi7
         0SQV5H9cg+plJ7oSsiFIPYeIOeDyre6AsAbgV14JtmhHoH54fjVAkvUVJunF6uLzf/N1
         9SIbCFxJ3PDkD0sp/PeN2mHZcneaP6aklCHgupvmZ/XlhaXxTgJyBanu99nsYmi3N8/L
         tOW9fJBrzVn6sy8NuG7anEIiacQqHnM83NScscIxua1Pj4S4IWefgN048fRawdPcCK/W
         4xFBobxMae7gjv83MUxhg3O2of2gPad7KBkzGkukMvibhmKpzaE51e/WReSxG9BPq8gR
         exaA==
X-Forwarded-Encrypted: i=1; AHgh+RpWSrqtu66E0hHhXdU64vCh7f4n/OaPFB6Nt7i7NR8n8dw6JwueIccaGVSJXQmcDxDWK3E=@lists.linux.dev
X-Gm-Message-State: AOJu0YwJkB1yv7nmTqSxzaX4eaubxpoiofj7aYr0B0f53CnB+iYNZcPI
	LMfX+J42mgem2BMIKSMB5Q/qErYlQndG/XnTbquTSlKcrNJnqf2CFk9cbhUKJP2srFO3qc5JRML
	FLng8YWe0eieOLmcCNwGTqhGYw877M2sIRg+1uoQhnt8DQ67IkZMlbg==
X-Gm-Gg: AR+sD103EJDreTw3e8qQmI1AC3X+/ybLrMHwdz2YzfZE0rQa2MgqRjSIuCMyQ8yK3zq
	BINB6xIplGISWUiKZ5twdriL7grZDN8gmlPdNVcXRUg0W2ioyhIValJuEgLt52P+olSwMGhnfNT
	5jDQl0Vd3kGeBikHKl2g3F2A4zyuvtW6zFAUSHNwM/dVoLidTOH8IT6MUQYNALRL2pAeuXtCZvz
	naZjHUIwjG8QFAivSzbw/lpUDcsFTKfDtf+PwYENoUI0WLjXx3YdtII7shBarQQ0w5Eo4QwhuFV
	+ZgAiuG//EVSBU/JSHX4SP67YYylc+BS+9kTfkFigTIC1EpJiVIIYQ5e0XeRGlPovOSigsdYCGU
	n54L94cbZlRwPa2E4P8p3BgcMoJsxlVpSUvE=
X-Received: by 2002:a05:690c:698f:b0:81e:fd36:ff73 with SMTP id 00721157ae682-81fb891d54cmr25018657b3.5.1785433091934;
        Thu, 30 Jul 2026 10:38:11 -0700 (PDT)
X-Received: by 2002:a05:690c:698f:b0:81e:fd36:ff73 with SMTP id 00721157ae682-81fb891d54cmr25018367b3.5.1785433091480;
        Thu, 30 Jul 2026 10:38:11 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-81fb87315cdsm14274757b3.0.2026.07.30.10.38.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 10:38:10 -0700 (PDT)
Date: Thu, 30 Jul 2026 13:38:08 -0400
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
Subject: Re: [PATCH v8 05/12] clk: zte: Add Clock registration infrastructure
Message-ID: <amuMADxexEuJJG44@redhat.com>
References: <20260727-zx29clk-v8-0-7a107b00f1dd@gmail.com>
 <amiw7mfPfSPjLHLH@redhat.com>
 <ami0TaY84IslWZyo@redhat.com>
 <MwDLqBgXR7G6dGkTtCaRrQ@gmail.com>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <MwDLqBgXR7G6dGkTtCaRrQ@gmail.com>
User-Agent: Mutt/2.4.0 (2026-06-19)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 5EWvIN168HAoE76C53nC_03tx5XqTflyJbx7PR7uF08_1785433092
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Hi Stefan,

On Wed, Jul 29, 2026 at 12:25:34AM +0300, Stefan Dösinger wrote:
> Thanks for the review!
> 
> Am Dienstag, 28. Juli 2026, 16:53:17 Ostafrikanische Zeit schrieben Sie:
> > Looking into the other patches. There's more mixing of the clk provider
> > calling the clk consumer APIs here. It looks like this just takes a
> > reference and holds them. Would moving to parent_data address this?
> 
> I think so. parent_data::fw_name is indeed something I have been looking for 
> and didn't stumble across myself. And I suspect when you say "use 
> parent_data", you don't mean "use parent_data.name everywhere".
> 
> But it raises the question of how to handle internal clocks, e.g. foo_gate-
> >foo_div->foo_mux->clock-26m. Only "clock-26m" is passed through the DT and 
> found via fw_name, and only foo_gate is exported.
> 
> For the other clocks I currently rely on the string matching to resolve the 
> parent named in the static init data to an actual registered clk_hw. The 
> alternative I see is storing the struct clk_hw * in a table by index and pass 
> it in parent_data.hw, but that'd require managing the extra indices. Or build 
> a clock-local name->clk_hw lookup, but then I am just reinventing the old name 
> matching.
> 
> Am I missing something obvious? Is there a canonical implementation somewhere 
> that implements modern best practices? I learned that looking at existing 
> drivers isn't always a reliable guide.

You'll want to register all of the clocks with the subsystem. Take a
look at drivers/clk/qcom/gcc-sa8775p.c and here's an example I picked
at random that shows how you can reference the parents with the
parent_data:

static const struct clk_parent_data gcc_parent_data_8[] = {
        { .index = DT_BI_TCXO },
        { .hw = &gcc_gpll7.clkr.hw },
        { .index = DT_RXC1_REF_CLK },
        { .hw = &gcc_gpll0_out_even.clkr.hw },
};

static struct clk_rcg2 gcc_emac1_rgmii_clk_src = {
	...
        .clkr.hw.init = &(const struct clk_init_data){
                .name = "gcc_emac1_rgmii_clk_src",
                .parent_data = gcc_parent_data_8,
                .num_parents = ARRAY_SIZE(gcc_parent_data_8),
                .ops = &clk_rcg2_shared_ops,
        },
};      

Brian

