Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=44.202.169.37
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793114833;
	b=tTc18a3Qv47+YDd7ZpQpw3WDDJn2ma5ny+4XFqIiBqhE90Vb5fkhpGSNG5p3uIf1AKWu
	 6l7S1baNA7esyvQ7V/b2qdANXU6pXAjAAeKWj1t73q2GtCTOELhGf+frERAg/4dZWrNCV
	 i0P4PBhTYFNwitqFR2kSRbKYtoYkxJH/YY+5llasYHt0f5+3YvIW/v2JHVb6LNvrCtS8i
	 KOQHDX1i+2UIw4p7iwgEIM/luEXakOZv/2bT2NxN9G4+H4QCLujvW6MKiO/o5L1uLFjti
	 qXYafKf2JZx3nzT0qsygzpIdZSYOtthQrJ1Df0SQ/+O1ue6IzMIP+GYi6K0KiRhJEjA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793114833;
	h=DMARC-Filter:Received:Received:X-Authority-Analysis:DKIM-Signature:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To:X-AntiAbuse:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-BWhitelist:X-Source-IP:
	 X-Source-L:X-Exim-ID:X-Source:X-Source-Args:X-Source-Dir:
	 X-Source-Sender:X-Source-Auth:X-Email-Count:X-Org:X-Source-Cap:
	 X-Local-Domain:X-CMAE-Envelope;
	bh=hcVetJ3j4Yw0L4vaeF4Sin3e+Kqt87+IIjhgJbDSvlc=;
	b=A/k0qFUAsARlfUWENBSh0vKHnLr6vxDXZ1R+HLIajiwODWTo5d4UoGjyl2bURoxvdCY5
	 tu04+esjZSb/K9Hmw8haKj29F+MbGwwhJKZx+6/xH1CfFZns2cfyP14RhmTb2LKJP66b6
	 ZtG/BxhVmBxdzMHUaK0lYsN4EmohQlN562Fga3xv4sku/st/PKLSF7cQYfUuRavmvuaA3
	 XS7RhZ4vGO4/gXD3LPmmePKj3qmDh4u8cFwjN4AEtFl6nfP7ZWSOP/vNHTaqz9Dk/EtPL
	 B3QK/Bz7e/cOVBvMXle6QEfR+H9EuMCcJkzA5ziIdgJsasGVsx3MdmlMQ50iGOach3A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=fail smtp.mailfrom=roeck-us.net;
	dkim=pass header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=FmxUwmAs;
	arc=none smtp.remote-ip=44.202.169.37
Received: from omta038.useast.a.cloudfilter.net (omta038.useast.a.cloudfilter.net [44.202.169.37])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59B90606A324
	for <mfd@lists.linux.dev>; Tue, 27 Oct 2026 15:27:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 59B90606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=FmxUwmAs
Received: from eig-obgw-5003b.ext.cloudfilter.net ([10.0.29.155])
	by cmsmtp with ESMTPS
	id Li8mxZofJJFmFLj4yxKAhJ; Tue, 27 Oct 2026 15:27:12 +0000
Received: from 162-215-252-36.unifiedlayer.com ([208.91.199.152])
	by cmsmtp with ESMTPS
	id Lj4xxWPMSf4wOLj4yx33JZ; Tue, 27 Oct 2026 15:27:12 +0000
X-Authority-Analysis: v=2.4 cv=db2A3WXe c=1 sm=1 tr=0 ts=6ae0c2d0
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=M0FbrtG7MMAA:10 a=xkLUNt4dAAAA:8
 a=zk4-lHRcAAAA:8 a=X3a0BiUdAAAA:8 a=_jlGtV7tAAAA:8 a=OpKgjLFNguK3uynLL7kA:9
 a=CjuIK1q_8ugA:10 a=A2EApc-QTtVVSfvlwUcc:22 a=7cv85riZL9-k45RWW8P6:22
 a=aWu3muFgq6otJbhCXpL5:22 a=nlm17XC03S6CtCLSeiRr:22 a=KPbNTLLc3YvdawN95zVk:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default; h=In-Reply-To:Content-Type:MIME-Version:References
	:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding
	:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=hcVetJ3j4Yw0L4vaeF4Sin3e+Kqt87+IIjhgJbDSvlc=; b=FmxUwmAs7mF4dF4b3MQBl8bdVb
	tiCn1dYzKJ0/5zMuy3Dkl5KtJ1CdWrSMhaagLq87Gx1uPeduOFJAZZReNPm7krFrp0E60KhUlLIDc
	70bByHiXUwq6iK+SuZfP+qFgtQERObuDjcXRMpBCSrAB+a4BQNBCvwyL7kA0dqv78KyQ6qQWLmyRA
	Hq42mLTB+P7mkwhAHTZEbxhOIJ8RQ+dr6VZLeMOToBzgTx990t+r2R8igmo3YeZYI720aXTIoEzEs
	LnG2PVoLpX07aKgbwkJl8Q9l2uD8LdzNHoRsOylbfZGPe9Q4HIZozVgI9EWjY8N/Ouib2/Lj2x8ET
	IhcPGRCw==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:41180 helo=server.roeck-us.net)
	by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <linux@roeck-us.net>)
	id 1xLj4v-00000000Fjr-01VO;
	Tue, 27 Oct 2026 20:57:09 +0530
Date: Tue, 27 Oct 2026 08:27:07 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Primoz Fiser <primoz.fiser@norik.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Support Opensource <support.opensource@diasemi.com>,
	Lee Jones <lee@kernel.org>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	mfd@lists.linux.dev, linux-watchdog@vger.kernel.org,
	upstream@lists.phytec.de, andrej.picej@norik.com
Subject: Re: [PATCH v2 3/4] watchdog: da9062: Add support for dlg,wdt-sd
 property
Message-ID: <2365680e-3319-4ee1-90f4-33041e8f701b@roeck-us.net>
References: <20260924065044.368341-1-primoz.fiser@norik.com>
 <20260924065044.368341-4-primoz.fiser@norik.com>
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260924065044.368341-4-primoz.fiser@norik.com>
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - bh-25.webhostbox.net
X-AntiAbuse: Original Domain - lists.linux.dev
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - roeck-us.net
X-BWhitelist: no
X-Source-IP: 108.223.40.66
X-Source-L: No
X-Exim-ID: 1xLj4v-00000000Fjr-01VO
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net (server.roeck-us.net) [108.223.40.66]:41180
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 23
X-Org: HG=direseller_whb_net_legacy;ORG=directi;
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfKaV5Gqm/kMHUSBfIf9/uNXDRW6R7EpRRqvKNZ1GE+anyJXmq+VfPqVyIfI5/ctcMJcm/p1VQQjzVVGKm4Td6h8mgueybZ5Lkh5F+wnr9HH+0rzbCAcb
 U8j9frrkz5ss7ueOsQMe2dc5y3TZWKAMruwXX6r45sQ8TPsE16ZlVqzmPH/ZZvjzmJgMZH7UxNGq9a3sAVpLW7RbWwqhVtA52nM=

On Thu, Sep 24, 2026 at 08:50:43AM +0200, Primoz Fiser wrote:
> From: Andrej Picej <andrej.picej@norik.com>
> 
> Implement a method to change watchdog timeout configuration based on the
> "dlg,wdt-sd" devicetree property. Setting the WATCHDOG_SD bit enables
> SHUTDOWN mode, and clearing it enables POWERDOWN mode on watchdog
> timeout.
> 
> If no devicetree property is specified, the WATCHDOG_SD bit stays in the
> default configuration, not breaking behaviour of devices which might
> depend on default fuse configuration.
> 
> Signed-off-by: Andrej Picej <andrej.picej@norik.com>
> Tested-by: Christoph Niedermaier <cniedermaier@dh-electronics.com>
> Reviewed-by: Adam Thomson <Adam.Thomson.Opensource@diasemi.com>
> Acked-by: Guenter Roeck <linux@roeck-us.net>
> Reviewed-by: Guenter Roeck <linux@roeck-us.net>
> Signed-off-by: Primoz Fiser <primoz.fiser@norik.com>

Applied.

Note that this depends on the mfd patches making CONFIG_I writeable. Those
patches have been accepted but are (as of this writing) not yet upstream.
Assumption is that both this and the CONFIG_I patches will be applied
with the 7.5 merge window.

Thanks,
Guenter
