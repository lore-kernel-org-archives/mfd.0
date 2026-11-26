Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795700169;
	b=OkuUN1nOU6jx7TF+/Uj/2Zp07GVlbM7NIxCofzn1G5SECfqt60VyJZHwGmQwIzsZNDvb
	 BkP/xWpyzuTzLlVA/hFs9oKjR4H9LQ9vLfwP4It+vJBIRXBiWZ+GuuXhx9qvbxghFRq39
	 CUrig3dZ/gqjTNv/qxnAZTYKPfVu2SOpiJSSC0eKAunH6FGQP/iRKwD9S9FVVMLiZ9SSj
	 rWqOHsSsFGLVw5YWXN3pvZ9SNmn2bsBbxFz+OfzfJ5CjoOUviaE+cKFtMl1+nxMaFDRTA
	 /1Y+2pkci5AqrsX/vvnvJrzAFOBSftJ9X6D/MvF/EF7lf+mFE4qOT8ijkTF5+5iUqcg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795700169;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=Utaa576/YNOAzmZSRb6tmvqnsIPMuMPqidCVjvoZ4Fw=;
	b=Xb06CHwsQnKfq6//XDoYZuISBA8bfrk8l57YNuDoPepVn/Rqiustn9N9X5PyZIF8F56u
	 1h9fnEv5iZCqqdh/yBL/aMPUgZROPp6QBfpQfvLLmsVTxcPJFSfg3+BDjMV+QHZantC6x
	 KG5FR+rYoWGPKVJInOMHMxrqN/qJ1f0y8O4TJSc24zBrSLFGNreK4kOOiUCW2waGMyrQP
	 w7QOLF1k7kYbN3ys03U2QyapxUaCg2cU36Rw5GfVMSwlh+Yksf4klAUDvAmpMgdTlfGsW
	 NBWfhCP5n1q8I+JpUkDgBMRbB6QMYOdoPhrs1pgyh+sF7y4AhfT3j17jjfC0X33Xzww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Tqc6b11L;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECF40606A31C
	for <mfd@lists.linux.dev>; Thu, 26 Nov 2026 13:36:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Tqc6b11L
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68C581F000C4;
	Thu, 26 Nov 2026 13:36:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795700168;
	bh=Utaa576/YNOAzmZSRb6tmvqnsIPMuMPqidCVjvoZ4Fw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Tqc6b11LNk+T2KJFwpY/VRWpe2ab/lk6W9UsvJoHGgkdnTbYrcA4dwZms0tdrQsS+
	 pG6fnsbhtcstdwrnf1y1JRTl7dL4SMe/TN7htTR14VPtF/BqydJILkKxixSwn+aZwv
	 YTmNPqo/6MQ9Pzm3bbh02KyF77/s9BNP5VaP1BMW8FsLEfKGeCSha1ZJ9ZBgXvhLRD
	 5ydY/biLOA6CggZgKmPYM+jkpR06KnyIQi+nWmfDddFR+Wn0OpdUvm2UoEqqnedaMM
	 PlPu1XCbM21rrHhV0h4X2uwI0oyj6WtxPcZy2eB2zrOGBwfipKBldoEY+L/M80f6FA
	 PJvYSAnpi23rw==
Message-ID: <sashiko-outbox-235627@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 0/2] mfd: Remove LP873x and TPS65218 child devices on
 teardown
Reply-To: sashiko-reviews@lists.linux.dev
To: "Tian Xuechen" <202300460064@mail.sdu.edu.cn>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20261126132803.4091137-1-202300460064@mail.sdu.edu.cn>
References: <20261126132803.4091137-1-202300460064@mail.sdu.edu.cn>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 26 Nov 2026 13:36:06 +0000
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list

Sashiko has reviewed this 2-patch series and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261126132803.4091=
137-1-202300460064@mail.sdu.edu.cn
