Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795204294;
	b=UB0Zo7L6Ijgjk86ktJSNtatOrchxCcSTiC9xvKhPubWFgtemHvhWyhny8z1evPpE4u/v
	 yX0j21VrIoC8f9SzK5DMTeWzTmQN1eITTDDcPNE3K94k5cg9JBhUzp+R16ZPcMlMz69BP
	 0cw8p1NV6w5rl0h2Irw4iI2AFooN7cADBXHSlcjxgKTMckLzxIpQBup3096ctU5jm91tJ
	 jQFVSx4sphU44mKlh2sEglNB2MxO7HrFyQN/pfe5k2IQv4M2pf+KHi0VFFNGt9sGmGsBD
	 j+eUeW9AJQvHfhp3ck/hGiMY/Q5z54muynNTlQGcX1lXbe6N0CLRpEdp+xcuZtXbkSg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795204294;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=VmRCyd/7UkQRrCtECiaF/RIUZrvqgSmC0sNW1Szk4fg=;
	b=GRk2+AvXwiBW/Ui5QZpz01N7GeKGPUaAQGZbiq26zAS8rUKpmKAVWAmjgAkulLQgCvYS
	 C/OA2lbCgiYJslTiDgUED43gr0Z5kaTkcl5CS01qUMZ1yRd84HUX9sDvwelJpEBhBcKwk
	 v7X1YTVK61h8mCJOwTu2ANw/PXbhMjOLS9s8csRcJnL+y8ScKDobY4V1NweYm4HPUERot
	 tIAcl6kGUj8bFy2fB7KYkDup7bdn7ORT7W/eZ/La7gEfNDeSiec134IlaoB0bWjxjrUrZ
	 xdXX62n4yHT82Fz9uDSBn2UQOzsfIkrmX7t2aYMgBN4d9W7pfHxKeyR9yyfopg3niSw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NbZO4i1C;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57529606A6C2
	for <mfd@lists.linux.dev>; Fri, 20 Nov 2026 19:51:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NbZO4i1C
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76AFB1F000CA;
	Fri, 20 Nov 2026 19:51:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795204293;
	bh=VmRCyd/7UkQRrCtECiaF/RIUZrvqgSmC0sNW1Szk4fg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=NbZO4i1CiGsdHZdIoDu9d1+nd2yMXW5twinWMwVy7nu8wT+vyN5zHzISoCI3KL1sF
	 lgDbPiTvKAMm2lvDscBdIodj/Ss5vFPByI2s2+7cATeDzGg/4wBg67zz8tHXVv1PuF
	 coEsv0G2K8f5PhtFCLoKq5A+6n7+Vr3WdyFRQoh4sq8Fna1cYJkgfiNfMJube5wFBZ
	 fCT+WHuB4ggDOmM/eWGUOFnNoXJ/1NrSDLXv/3gwcDzA+4LRRtvhqyLI4doPkdSI6f
	 PLxnOGt8z2VvPEVlQjDlxLXYiyfb2j3BMHFptp3PzUcKCwrXL/a0BOiC/0gZTimE7F
	 FpfiHQ8V+sUCA==
Message-ID: <sashiko-outbox-225965@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 0/6] ZTE zx297520v3 USB support
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?U3RlZmFuIETDtnNpbmdlcg==?= <stefandoesinger@gmail.com>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20261120-zx29usb-v1-0-b0433258e51b@gmail.com>
References: <20261120-zx29usb-v1-0-b0433258e51b@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 20 Nov 2026 19:51:33 +0000
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list

Sashiko has finished reviewing this 6-patch series:

- Patches 2, 5, and 6: no issues found.
- Patch 1 ("dt-bindings: soc: zte: Document zx297520v3 socsys co..."): 1
  potential issue (1 Low)
- Patch 3 ("pmdomain: zte: Add a zx297520v3 power domain driver"): 2
  potential issues (2 High)
- Patch 4 ("phy: zte: Add a zx29 USB PHY driver."): 1 potential issue (1
  Medium)

Detailed reviews have been sent as separate replies to patches 1, 3, and
4.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261120-zx29usb-v1=
-0-b0433258e51b@gmail.com
