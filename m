Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795553796;
	b=t5tPAmqPHAYfo0oDq255j9vqr+ctqZrMEVdFij22O0JlNC+ooQ/XbriaaL7L63hAP4WJ
	 rcsPaxQYyWJVp8SNBX7pYZ15gfq1xJggh1wYgD+83MH0Zi8LAQaWtmUYzXuXoUAoEJAHg
	 aJB2B0psPr9J4H08+nEY+qvqhmlOaCTalbS362BHaTAplRnQtPCSX0xuTx55wPwaMe1wU
	 Jjp3KbPOQjTHoJJ4JMYX0rroDv0vSJmEXIflABATFRUQwquda6qVR5TH1WRqZVNOVZxsi
	 asS4FZUyM9T1OmSS73d0gfkw+w1gaHQ3OOZVJPO3pfFNyPabeC3aHnqr1MPvxh6x2ow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795553796;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=qTI+eOrNNQB8IbkMYsZpnzmCx93XXewti48zte/W8bg=;
	b=sgegkkClrpzrIszFNU7r+ZXZNSkXtjBQKeF+N+hNJ+sOcCYMLYkV5FD4Pixd3Oa7iJH4
	 DKC1WyLL0rUGiPIlqN/GJOe/UepDKWrXfHtJ6BgTSFF2DYhIVdR9E8g9sHMW/2FAkcSUT
	 qLg6OkYo8PgHQHUcTggsNsuhr9bQZ/c7lfTJvUbPrGJLAQhvDnvMC+ywFDCLIh8SpHDwk
	 WKdfKa5JlVgZB1ABIj/oQk99szQw+PGOQTUszB29Tn9ZVhh6iaQEgBKPYn0hrb3QcTper
	 MBTcjli13n7axvSeSx7X5SHYHQjZFn6Y23J8OMb175F/fiL0dtszvXLu2wNo2ldZUGA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ki7ycLac;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20888606A323
	for <mfd@lists.linux.dev>; Tue, 24 Nov 2026 20:56:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ki7ycLac
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C57C21F000C6;
	Tue, 24 Nov 2026 20:56:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795553795;
	bh=qTI+eOrNNQB8IbkMYsZpnzmCx93XXewti48zte/W8bg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Ki7ycLacrPx4ugRtzCrK0XoQN8tpjvGMclKCy1QvotNwrMtLoMY1cnFnM1HJjIJc5
	 5y0hDsW5Ig5IJ+GUa4yvjrCB77VPb6zyivSMDAcv1R/Xz14uNBU1FB7NtZBbpyY789
	 yqBRNFgmuNA28tTIW7xCPA7p/gDSsGDTHiOLpH0g2Lw/N60Sm4DYOCzPklDszQGRRa
	 sM5rjW38RoIbouo5y3gznhWF4TwDND5a0cFm0MdbcdxtvD18oenXO/45od7CFAOONJ
	 imhsosnrNrSrAiYrzUZJaR8xv1lv9CEKoLTcV8gKDxsa9McZl0+5YTXA6V5r8D4ut5
	 GSLVXeQ7vHtgw==
Message-ID: <sashiko-outbox-232011@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 0/9] arm64: dts: marvell: DT warning fixes
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?Um9iIEhlcnJpbmcgKEFybSk=?= <robh@kernel.org>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20261124-dtbs-marvell-v2-0-663009a769da@kernel.org>
References: <20261124-dtbs-marvell-v2-0-663009a769da@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 24 Nov 2026 20:56:35 +0000
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list

Sashiko has reviewed this 9-patch series and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261124-dtbs-marve=
ll-v2-0-663009a769da@kernel.org
