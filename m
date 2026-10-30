Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793341632;
	b=JMRv+GMIYqliHIuF7ED/WM9Z5kqVM7Qt81WqxKcW9aUmpc5LBpo9txFsBmsum4C93Sx7
	 bxeqjF5XrK0ToQXZ67jzfac/nQYXcd1vwDMMgwr75tGa8bu0h1L4AOrZA1wZ0W5vP0EwY
	 TFDqrhwrUusCYmNnEdLYsazptKrlS2NHTmOWDnnkFZ4l1baejoCZB2tHbnzCU+zcXQ9rm
	 09K7UZpH1RWdtjJsdtPFNV3/pwlaZya+LMt04O4vuOhWflQaXdwVFEIOOUUZBaljDLuBl
	 tq5heG+fHvfSDX4ST5JN9FJ/DXY7/Sv7iZFvHB30ZfNobvtazON/J8eTD2VsOYcmGEQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793341632;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=Ne+xAZq5SQGuGYyRfmIqS80N5nsIPMyq//Mo7JYVs1A=;
	b=ntYdke0ZrJirSQ6kw+3NzaaynrIM76QzBqhuCCmExmnFfSidZDTD5uRGjH1N3F5vsmuB
	 Cd/mumDMciqUIx6XMUmZcGKw96D5hTU5KEuYXutkbFNYLg/ncnhVVgs2DeuNgVx2Q9L4B
	 m4tbbSKFSDjF0L3YOZaCQ7q22LouWdg/k3mt0UrQFjy3nr4f5gS2HzvteGIj5Cgm82yQt
	 ClTk2R+lMLpl5zXyt2l2pAUjLTjn2FAa+Xz+cuSX3HvYQa/Gii4tYsr3DWupEq+BE/Hhz
	 qpZJuR6Paj5k73iEXcxXaFKnbKdABQrwllJZVWVwLzGNb4imHNDd7PBoXzVmoHbZIYA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZywPJoNv;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 596BA606A325
	for <mfd@lists.linux.dev>; Fri, 30 Oct 2026 06:27:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZywPJoNv
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BEBE81F0093A;
	Fri, 30 Oct 2026 06:27:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793341631;
	bh=Ne+xAZq5SQGuGYyRfmIqS80N5nsIPMyq//Mo7JYVs1A=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ZywPJoNvH8Ucb7Y7NFT1wJcs6FzjObPfQ+fQLYSbgblrFkk7iyrOgRsNNtZXhy/aA
	 WYYqA0iz6zDZdo3AOE+S8QasrarxB+aR6zZF8Kfowe3ruJ1o+bqAdO7FOcj43kJXx7
	 48GHJ37gHmp4wJTgLdSyMTZ1FFJknwIkDEJS3G6lyEELI9cM+wE8Le/apw2AHDERIv
	 qeaeUpKL6B83Ac5Yy1eQz4jLKcZ2UZoGb3xZc7s43tY0ydBiTXvrLT6SCjvq+kx0Cq
	 3bnvINaiGlLT4zVSO0ogaHyf/6WX16wz1p7V2uN7Js/IgX262y8LuLjQzrmeQ/u20O
	 p54PxdsSx5r8g==
Message-ID: <sashiko-outbox-190597@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 7/7] mfd: qcom-pm8008: Tolerate missing interrupt
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jishnu Prakash" <jishnu.prakash@oss.qualcomm.com>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20261030-pm8010_i2c_support-v3-7-995ed1ec7a72@oss.qualcomm.com>
References: <20261030-pm8010_i2c_support-v3-0-995ed1ec7a72@oss.qualcomm.com>
 <20261030-pm8010_i2c_support-v3-7-995ed1ec7a72@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 30 Oct 2026 06:27:11 +0000
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list

> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>=20
> PM8010 is often wired up with the interrupt pin tied to ground. Only
> register the IRQ infrastructure if we have a parent irq.
>=20
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Co-developed-by: Dhruvin Rajpura <drajpura@qti.qualcomm.com>
> Signed-off-by: Dhruvin Rajpura <drajpura@qti.qualcomm.com>
> Tested-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com> # Glymur CRD
> Tested-by: Burke Cates <burke.cates@gmail.com> # ASUS Zenbook A16 (UX3607=
OA)
> Co-developed-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
> Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261030-pm8010_i2c=
_support-v3-0-995ed1ec7a72@oss.qualcomm.com?part=3D7

