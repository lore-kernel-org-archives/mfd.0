Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795824288;
	b=FgByROCjvAUxh7WaeqOQFcrNjIgNPp2xhVoS7rVeGtWQPYd+zIIZgNC6Kbb5A9kD3FBF
	 M5ptzDwmXOKY8q1tn/Jn9vICX7XHhcoRTjuO2lXy6/5r3EjinXOGrRshWVidNJUdEaABG
	 BP2cRcSFOh1CXZN5GdZJGo98OtJaI0t0T36GYyu9eTKqIAri7MkalHmfQgIRHoA0tpr2O
	 hRswSC6r1eyWjUuvcOiebCSinmqYTSC/EjleGVJwa/ULPVNBTD5+5e/jw8Xhq1rSVhbb2
	 gJlweGA+Upi8A9HPvNwsJ8PaZ5Mz4m8ityBCJibHB0GwTdOB805O5SCmRRCFc44IsFg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795824288;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=QjOihqWjKFTNdfd6kwnzonraDIJ71umA0NRL5K+HkaA=;
	b=RmDKkztuNarGLvxlaRIX3zXsdZ/7vfRH6B093aG3jnbVRfZyIIXWOn6/S35b24hH2bRz
	 juTxixoRwXNN0zHin2xrWPqh1b0WfywOTKYwW9VMcF82PReheNvb5yTN3mYy14OUOD+5Z
	 IzMM1QE62Zexq7cvHniDzjruty6uRniewAAkpyfAVddTq9JgDK1wQJh+it5RoZJqhq+ui
	 2uu4PBymEJiYy3Pof7AUJD2teEX4gmIO0rcpo44ZMxBTexR1+/DZyjAkJC/RHwjGDGI8q
	 cnJ8bFxsAhtaU7THCubVFycg01vlFKFNOe0I2teWnlTGsutUghRRp1VuEZJti5yotwQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jZj8qCb1;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 601D8606A31C
	for <mfd@lists.linux.dev>; Sat, 28 Nov 2026 00:04:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jZj8qCb1
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C548F1F00893;
	Sat, 28 Nov 2026 00:04:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795824287;
	bh=QjOihqWjKFTNdfd6kwnzonraDIJ71umA0NRL5K+HkaA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=jZj8qCb1y41v0v7X8FdcE1RZiRW9y8Ro35n0M1dHAdbjHjRegC4MglTi0CgsvJiEt
	 QhKdJPcgjarcYzfn1Tum7pXUMCfeocGkNXgx6qqFc2sVKx5i+jFoJQ1flEEcq6FfOo
	 P6tgGrbvFTJ2MFWsPewoTWI/oem3lMGOgKMM5P1+0vvpMTg6bN9xMh/cevTltn9fyN
	 aGA2wBSliCnSw0XYpNCvlC4/RL0on9vxrB3Y2xjIM20XGoW2+E494keqqr7taPbMbX
	 hZvts2xViLCaOAoP+3/cQBHnTRqEFNS6bb1Pjm8aqAggugCQOKncvmZ4sEW1t//EbD
	 2zVcWRWw7rzMg==
Message-ID: <sashiko-outbox-238358@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 0/6] Move DB8500 PRCMU clock policy into the clock
 subsystem
Reply-To: sashiko-reviews@lists.linux.dev
To: "Linus Walleij" <linusw@kernel.org>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20261128-ux500-prcmu-clock-move-v1-0-77c49daad1d2@kernel.org>
References: <20261128-ux500-prcmu-clock-move-v1-0-77c49daad1d2@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 28 Nov 2026 00:04:47 +0000
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list

Sashiko has reviewed this 6-patch series and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261128-ux500-prcm=
u-clock-move-v1-0-77c49daad1d2@kernel.org
