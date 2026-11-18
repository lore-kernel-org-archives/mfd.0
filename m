Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795010061;
	b=zZd8i5p47XG7O+8bg4bFmVA2wxZZBuW5Zu5UvTZae2DWXLfGqnedd7Jhdz7874W5LzL9
	 gcpq0rErr4Ugc5SdDD4VBirBB4uNjXVGxuVTuMe6G07vYUPQJ/t0goKKkwW1UTnCn4JKN
	 +r7Ccr3yASmzmEcC69WpcRqoKML4fhhcNCMV1NqIgXsKP2sbBtN7YB2sV2+lHGxXI/4cZ
	 +CSK2hWlwP8qcbSdr0rNoOdsqkyDWUrqnM8a4Muvm9sA3Wx+I3ERE7cxm9b7jfVXkUb49
	 RRI4RMCKlCtyf112HY2YW2hJRAQwH26Pa3pkBQmtg/XKrNKaPCqcOGWYrDcVnz5kjVA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795010061;
	h=Received:DKIM-Signature:From:To:Cc:In-Reply-To:References:Subject:
	 Message-Id:Date:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Mailer;
	bh=kzGMn3RZdHoP+1BarQqYMq7gL7J1eh3K0osuCxgs0HY=;
	b=AtGTcEKsknhwUEmljP4wdqVSJKO1XWa7XL1AzWJ2aj+XgpCZ+ybykyrXNjXYA0lWUFpy
	 x7WjupP+zCfRmnUCRGPW7oDUqPbqQcM+SZLqsSNZKSCQRwB3EvwH8lQ7omllFUIO6yPk0
	 HMvzewFfDXu4Nq9gOfA/Do9itPBqyWEaERyuLraFi9/XpZ6UGe6JSutv5UfyM93l4kylQ
	 h4oyzptUSlvoVZDpMglnDsb4aapR9GMf88Z5WTfMbDaZaIr7vAtobAltEM9J4mzhjPU1N
	 Y2PbnIsvSEn0oKvG2akzptC7SJbRyHIOFi2XVlBK05NljZHtLM58VJ8wsvYpagKy2Gw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="Oke1NnA/";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BD7C606A31C;
	Wed, 18 Nov 2026 13:54:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Oke1NnA/
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 598E61F000C5;
	Wed, 18 Nov 2026 13:54:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795010061;
	bh=kzGMn3RZdHoP+1BarQqYMq7gL7J1eh3K0osuCxgs0HY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=Oke1NnA/DpMCH9q8bXF0/lA1C4rfbqU4R0U4Rn+aAWI88gC/rJUApsXCV+nILNAxA
	 mTgUvhXnafbjG1ljxWGnTE5seNPxJ/YuAKvnnTu6FLj9kaKLFSW6Pz6ugGJUFQCBMn
	 Rb+inUjaKJPBTtA/PLBhUvRh6ya7kdtUiYYbzHbTahxjrUxpqn/5CN2Dpf+GO29qS0
	 FTfyydFF7eGCM0Ocrx1uscVTWrUCfQXTATcsNyacI14ICxnVTGLwMNi3cAvpbVBKKX
	 gsJJDzS7Tc4Y8vJPvt4/sYSop2feyYsUvex1yBxhoKmOWpYZHKfk6i/XUg3dTVq+sN
	 5dL4HWbzhnnnA==
From: Lee Jones <lee@kernel.org>
To: Lee Jones <lee@kernel.org>, hyunjungg <hj351016@gmail.com>
Cc: mfd@lists.linux.dev, linux-kernel@vger.kernel.org
In-Reply-To: <20261105162722.1688960-1-hj351016@gmail.com>
References: <20261105162722.1688960-1-hj351016@gmail.com>
Subject: Re: (subset) [PATCH] mfd: si476x-i2c: cancel RDS drainer work
 before freeing RDS FIFO
Message-Id: <179501006012.26227.5532520377129437168.b4-ty@b4>
Date: Wed, 18 Nov 2026 13:54:20 +0000
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

On Fri, 06 Nov 2026 01:27:22 +0900, hyunjungg wrote:
> The RDS FIFO drainer work (core->rds_fifo_drainer) is scheduled from the
> interrupt dispatcher si476x_core_get_and_signal_status() whenever an
> SI476X_FM_RDS_INT interrupt is seen:
> 
> 	if (status & SI476X_FM_RDS_INT)
> 		si476x_core_start_rds_drainer_once(core);
> 
> [...]

Applied, thanks!

[1/1] mfd: si476x-i2c: cancel RDS drainer work before freeing RDS FIFO
      commit: f06fa446a04cbb3b7600d4566f774e268ecdde20

--
Lee Jones [李琼斯]

