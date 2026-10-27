Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793114692;
	b=R2qt/ap9GBRw+GrRhoI1otPO8bVCKGn0L40oL68GP15NRIMhVTFYfMgDa9PoHv8EshXk
	 m9Jmo7mjnOVYcLZ7B9OXCBszLwQhAK3GK7xrun52NsjuuHBCne75ynrOsUgLr6o3Zyesm
	 b/gn/XS/j64W/xMVLnP6YhTmAiVBo9xO1jUZz9CH4ZH+aDvOR9BNDEpiC4Q2ujVsCvYNx
	 GrINv/S5ZLYJLcapz8S+moIhBf1BzMDo4b0/OZe2SXZAW9ALh8AXwkQYZC4Scten6vg4r
	 iWRY3+X6jBtVJ3/1VQ4HlF8s2DxZguAZBrerIXGQn1btdFYxHkNV+hCVN7vQaZRDWOg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793114692;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=BstRdR26uz2xpntyFZiBdMeXA3JFymkoz+BLyzJwrsM=;
	b=dO/OthF3T2nrkVinRjKajMqeUnJdGOAl/BJ+8yiDvl8A0j5D7/nLIiT4O4R/IPXe90bP
	 bZBt5jR2gRGMaYA3b15myGhgNu6u4iq63cOp9zcb/UyEW9apMgqtyPkieM7hQcpO1ryxy
	 GARFIMPpszo7vtXVTlgJNiJUSNNmKuU3SbfppBdFrt3qG3/uuiPmhDdYhRxOFn33zcDSP
	 x/XxNKE9ywqHXFDAjsD2D3CmGpFXCjqHR5G2BL+Yjbtq/KC5GnK/CVQK15gG3xaSZzrQA
	 Xlu6LfX2yHBQ9sWGV3qkK3iW+MUAK8AAaeYF24KArXtu/LIPsR3G/Y9+IYjx2UIx3pg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EZxYG2wN;
	arc=none smtp.remote-ip=209.85.208.51
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D822606A326
	for <mfd@lists.linux.dev>; Tue, 27 Oct 2026 15:24:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6D822606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EZxYG2wN
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-6b429f71dbeso19323a12.1
        for <mfd@lists.linux.dev>; Tue, 27 Oct 2026 08:24:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793114691; x=1793719491; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=BstRdR26uz2xpntyFZiBdMeXA3JFymkoz+BLyzJwrsM=;
        b=EZxYG2wNF5P7qlHfFe1SwNlAnOmwz6KsTOZc0fdHXaqC943d1e8sM1qcdJXesgzE2c
         1ImfwbCNGpHrjTmdJgD538TdOocVwc+opZVg+jurWSMM+mcm30jg6iovf7fAcmSf8k7g
         +ID5+F2zTLRXnSy6bCV2fxDYKG609JG1ZxZFfHin5NTUQtTZpCA951vaJrQl6/PXbBuc
         8ccFHtBwEtvZ3FuboS1K6J8ipwfIjxbxwaW6OLGOpE3y8sBbd7mvkps6qVtkOyPfuoXM
         t4Gf2fkHXYknLAW5dTKIPTYDAPtdHq0GYgQLzKLxHI+RwxgSVcu23SJw94rjoKxFy5qH
         Jp1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793114691; x=1793719491;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BstRdR26uz2xpntyFZiBdMeXA3JFymkoz+BLyzJwrsM=;
        b=ihGsvOU6Lg8ThufRpiGX38hZsS8Kk4Tf4/tZnBQWhrEyfmkWvqWRJLIUfRuGwlb6r4
         AExd1wap4MsnvSsOfzFgp4jAW6MCPjb3DVvRAGl4iv97l4nm+IWRoG5+w7WFKz34OxlQ
         Ecb7OkL6LjX9NeTLov70izx0WSj5p92EFPhd3kTaKL+hNqP7Cizc1dPbSf/ATF4uFFvL
         4ol2a5O2nUNtuT6uYtMSNP3aJGK1S4XwSXu18Br57cDpVr0WudsDAgSyTZd4Ww29uH+0
         o45PVcBURRHyhSgb2cyRGJ2tNhpSn6ya8hxDLrAEqCig4G6c4F9dxerX19f8bgs0l2sh
         CXcA==
X-Forwarded-Encrypted: i=1; AKwUvByP6F8BAOUIuQNtTcRHXLMr9pwHop6VThFlyMHEIhBtF/wj65fK9XytLt+aDV/lkWURRzU=@lists.linux.dev
X-Gm-Message-State: AFq9FYIceJuwFSGgXnMmPtE9QWjZ3rQNtKszx/HvLv5LyQXAJH2hY6AH
	ZU+CuF5mujTDhtC43y022KCxZVpj7Rcm5hu2oJsiLm7utROle+6emXxr
X-Gm-Gg: AYBFou3AAJoz+dpljCARh49q6oGbCflaAdS8dFiITfooef2rreguLJqK4FMwcDNjavf
	EUXVN6+vq+bcgBZ9GwZkvD7YWh8nYSCGBlUpXa/l2dUZdGW1IN+3lmwIp01YzmW0lMGdZg2mPi8
	FJleksdF7+SwgwGaEVdC0EGb887zA6OEzDSKdLKUUsVyLWmnLnunTPizhRQuRM42Rgtu56gfLIw
	hcPO4xlHUn5JTC8qrA2fTIgGrfmA62OCIa5JW3NwcAMOZE74eHCIYanwt08kfDH8useYDhw1IcH
	UMxcTE2g92Hr07+1tWMsGwkDQyU0kH0pQ4KVxh2oJR+86Up032t4TVaIEmvjvHlzOODaYm9mBw0
	yBWQFdSH0nxYfyUjCgQQZaabk8KuZDQkmMJIXWvbDLn5+JhgUzYVzXmmG0MJBWRXSER0g33Ibq8
	CSUvv/l42sA+YwwVH/1GHJ5nOTu98FzWBnMldtgMwUkkQNK77UEp6R77MncURnOihrVhd+859/k
	fRCjCaGfv9cUjXZlPugk+QZLUd3sboKra2F26qNbPqpsU4rRiJmxO89kj33qERnFMjO1BPjrxsE
X-Received: by 2002:a17:907:9619:b0:c26:1649:47ad with SMTP id a640c23a62f3a-c46bde828afmr1015997566b.35.1793114690459;
        Tue, 27 Oct 2026 08:24:50 -0700 (PDT)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46bd529b3csm467303866b.37.2026.10.27.08.24.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 08:24:49 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Lee Jones <lee@kernel.org>,
	Aaro Koskinen <aaro.koskinen@iki.fi>,
	Andreas Kemnade <andreas@kemnade.info>,
	Kevin Hilman <khilman@baylibre.com>,
	Roger Quadros <rogerq@kernel.org>,
	Tony Lindgren <tony@atomide.com>,
	Dmitry Osipenko <digetx@gmail.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-omap@vger.kernel.org,
	mfd@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/2] mfd: tps65910: Use modern API for poweroff and restart
Date: Tue, 27 Oct 2026 17:24:20 +0200
Message-ID: <20261027152423.194794-1-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Switch to modern way of registering poweroff call and add restart call.

---
Changes in v2:
- swapped to use dev_err_probe
- ddata is passed directly into handler
---

Dmitry Osipenko (2):
  mfd: tps65910: Use devm_register_power_off_handler()
  mfd: tps65910: Add restart handler

 drivers/mfd/tps65910.c | 36 ++++++++++++++++++++++++++++--------
 1 file changed, 28 insertions(+), 8 deletions(-)

-- 
2.53.0

