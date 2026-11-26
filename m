Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.84.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795683872;
	b=3Cob7s/q5FDgH+1J03LgMuT6n4Z7XlfFs10iziyHzz8aY6g9KAkztK2A5rYn+A5233r3
	 z0N8idtoT+WrZ5XXA2TZ2ZAf9Xq6lYOOzqALqOoPPehjQpgff+DmBgcskfP+P4PQL15C9
	 b2TewftAGnzy/mhDaFKQVtxjGQ5C7mbFfthMdc8UeOfK7mF8+X0g5lnsr8kG+u0QKleeu
	 xIIoWNQt/dJav/JYW5KyB4oPqA1I0FKm9Wah/Z5JSC7YsizReQxLTSji2+b1SNBzRYbyT
	 VVE/yccRY9BN6xmem2NdV/ToPdHNad6WkWKn7hQKMpfwitMBsyNHO8Ll68lpIjvnuaw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795683872;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id:X-Mailer:X-Last-TLS-Session-Version;
	bh=+epy5iM857+Y35amMUxIo3MbWvv+HCgyMNGV+6ss8Jc=;
	b=ZSxeY47BSQp2eU1ttg27l8CwytuoGaz63Q6dqHnOqmnnvtda+uq/IG0H612aLavNW5rZ
	 lTW12etD/WOZ4vAH5xe0wrZ8wwroEsJY+gV4Hggrd5Xs8V9yvBhtjqcAQWLJH+r0raEry
	 9KvCqiWdijAUk4UEg4lGehJEL+jr6ouUfjGCRq+06iAG6I/IFuNtdRgvWaKyPQ8Kxt/+N
	 xbuvE9xCMeDn8h61TYzhTnGGy3jZf6vWpDqSRou+nI7WxtpFJllO+DYsNX5aUZW+070fk
	 vY3vkilmYppupoBg5ThTVjKXhNw+w3NO84YsOE778sQA6gGKceelKzEtqOqknD7rrsw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=aRfbTQxw;
	arc=none smtp.remote-ip=185.246.84.56
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8DF7606A31C
	for <mfd@lists.linux.dev>; Thu, 26 Nov 2026 09:04:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A8DF7606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=aRfbTQxw
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 193F61A180A;
	Thu, 26 Nov 2026 09:04:29 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id DC41C60237;
	Thu, 26 Nov 2026 09:04:28 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E862E11E6A5EC;
	Thu, 26 Nov 2026 10:04:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795683868; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=+epy5iM857+Y35amMUxIo3MbWvv+HCgyMNGV+6ss8Jc=;
	b=aRfbTQxw1eIdufWRfZjIxbnYzQRjaNO8kbsIB3/NLSgOF9LgkCiOHwV8FVBVhPUZ8fTmLe
	nP4ruagJL5vXaGjwj/mMtgyFPeNWqfQ7UTIjoNiqItqtKsJEMLkdVIiS0E4+ti3voy4It/
	bQG8T/si+rQsvxQgodVf6NIArUaF6suxOg2P4QxFhKd4FGLR6UOnF7vwZSaXxrp1vYa+qj
	D3sJnLJwEnxn/1CqP8x3iNBIy+DfR6yXCvb5LGe+VIjtYTqcVyzQfwlJ9Q0VD4vi2jYHUC
	HkZBlxoORVjAiSjNbDfblzMU0etdQ7qnWA0wNsjylJnClPGYspFZiIq9UmToXA==
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
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v2] mfd: cgbc-core: Add support for conga-PA7
From: "Thomas Richard (congatec GmbH)" <thomas.richard@bootlin.com>
To: Markus Haberlander <markus.haberlander@rosenberger.com>
Cc: Thomas Richard <thomas.richard@bootlin.com>, Lee Jones <lee@kernel.org>, 
 mfd@lists.linux.dev, linux-kernel@vger.kernel.org, stable@vger.kernel.org
In-Reply-To: <20261124-cgbc-conga-pa7-v2-1-18a114b1801c@rosenberger.com>
References: <20261124-cgbc-conga-pa7-v2-1-18a114b1801c@rosenberger.com>
Date: Thu, 26 Nov 2026 10:04:13 +0100
Message-Id: <179568385320.302193.15039118220494670733.b4-review@b4>
X-Mailer: b4 0.16.0
X-Last-TLS-Session-Version: TLSv1.3

On Tue, 24 Nov 2026 10:22:38 +0100, Markus Haberlander <markus.haberlander@rosenberger.com> wrote:
> The conga-PA7 is a Pico-ITX board with an Intel Elkhart Lake SoC, like
> the conga-SA7 SMARC module. Its board controller is of the same
> generation and is accessed through the same I/O ports, so the existing
> driver works with it once the board is matched.
> 
> Match the board vendor and name.
> 
> [...]

Reviewed-by: Thomas Richard (congatec GmbH) <thomas.richard@bootlin.com>

-- 
Best Regards,
Thomas Richard

