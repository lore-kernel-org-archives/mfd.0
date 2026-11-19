Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795114366;
	b=avAR/7SS1Qmhl8AlPY4h4pGGHo396YOFw25TlF9MI3hTDZgBC1xS82QU9Wkog1Jq7lGA
	 T2G1ZZX/CezuMRON7BswduMHoMYIZ37n5ANXT0iJOXguDdzNY+o1PvnotdD7TjaeKHm2u
	 AJx91g7UQePwCZpEjZPPcdHgrbl44DZCybHPs4IVC5ntyycRZnXNOeFkiSxdoHhqo3W0b
	 ps/zP5ukeiMUbpikvpwmqGUy3kLx9lB6un9CmBn5fpfW+vtB9whS94myZ4O+Ff95QMunw
	 +Inkfm2B5wcOn2YFFdG3FsympK8gVrwDP89cQOTlF7vKy31e8e2RMlWqwkjC2wu+8Kg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795114366;
	h=Received:DKIM-Signature:From:To:Cc:In-Reply-To:References:Subject:
	 Message-Id:Date:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Mailer;
	bh=82nK9tN4SUSa2qi6vTHtLocU/pi0xXDC9NSq+2U2fz8=;
	b=29U+7a1DxQcD5ZkqiNUr879U+RcgNxePS6gOW6Pu5frG+DKl7H7BtfujtSRRAH0ckWBC
	 q7nUUK5DhT3WtJh7sftkjyNahnJhXFJTRbibY/12ReKdW54+amLs6ZL7SLHH99I4jAzS3
	 pIaJxqV0eSgt6ZQCnMNJAngRZ8YVztpWP7xdyDMns5EP7e/PwP/G9ufPF7xcdLXNiMuOT
	 iKN60mWqVKYe3+4Qw0dHFvKu0D46GrsaoZWPhYUF5WD1HubXpgYPWfKtRoFgbTvPeVZTR
	 PgWBZQ6VwT3FWD5WethpX0wHc8ewEIxqtF928iNP/jzNFGYcOVB+3Iu7XEl4JwTe5EQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=R367VU0l;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49A53607232A;
	Thu, 19 Nov 2026 18:52:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=R367VU0l
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 386CF1F0182A;
	Thu, 19 Nov 2026 18:52:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795114365;
	bh=82nK9tN4SUSa2qi6vTHtLocU/pi0xXDC9NSq+2U2fz8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=R367VU0lbn+D1aLL1Cl1NLB0s4MerjRq1WmUQChFHl12UrpbqnZDPOoNoGNFsyV/L
	 EOGN/WCIjC55RhJkYpSzbpqGA8apPMUdD5BfDERoN8BabhLLnq9JYV8nHoRTAHqSno
	 3IyzgmRtIxIjmq4aps2TO4GN1uQQB0ZxSQmUK+TmXHpP5JOwINxaEGtkDXjgx1HTln
	 UG55RMmBMwORM9/OjRe6WH5vrYKDSKUMjhC/ykXbF9t5JXcY6yorRujyasSfMB31gc
	 ilunHo9bZ1xtkXLLp9Enna2/FJUp4l4ttobdh+xoqcG6doJI/AoOKKkn1+AWejH7a7
	 Wdw6a9eYuFSng==
From: Lee Jones <lee@kernel.org>
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Richard Cochran <richardcochran@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>, 
 James Clark <jjc@jclark.com>
Cc: Siddharth Vadapalli <s-vadapalli@ti.com>, 
 Roger Quadros <rogerq@kernel.org>, 
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
 Martin Kaistra <martin.kaistra@linutronix.de>, 
 Vadim Fedorenko <vadim.fedorenko@linux.dev>, 
 Rahul Sharma <r-sharma3@ti.com>, Robert Nelson <robertcnelson@gmail.com>, 
 Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Chintan Vankar <c-vankar@ti.com>, netdev@vger.kernel.org, 
 devicetree@vger.kernel.org, mfd@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
In-Reply-To: <42bbc4a03679958f2ed4e195acea99fb57c68fd6.1794284248.git.jjc@jclark.com>
References: <42bbc4a03679958f2ed4e195acea99fb57c68fd6.1794284248.git.jjc@jclark.com>
Subject: Re: (subset) [PATCH net-next 1/3] dt-bindings: mfd: syscon: add
 ti,am654-gtc
Message-Id: <179511436097.97786.7515300839199702588.b4-ty@b4>
Date: Thu, 19 Nov 2026 18:52:40 +0000
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.16-dev-ad80c

On Tue, 10 Nov 2026 11:24:01 +0700, James Clark wrote:
> Add a compatible for the CFG0 register frame of the Global Timebase
> Counter (GTC) on TI K3 SoCs. The GTC is the system counter that the Arm
> cores read as the architected counter. CFG0 holds GTC_CFG0_PUSHEVT,
> which selects the counter bit that the GTC exports as its push event
> output; the CPTS driver writes to that register to provide hardware
> cross-timestamps.
> 
> [...]

Applied, thanks!

[1/3] dt-bindings: mfd: syscon: add ti,am654-gtc
      commit: e852a51a50385dd737fbb43ef637ba77900a8ccb

--
Lee Jones [李琼斯]

