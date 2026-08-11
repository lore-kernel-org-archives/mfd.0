Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com [209.85.167.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11E0B4192F9
	for <mfd@lists.linux.dev>; Tue, 11 Aug 2026 08:27:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786436870; cv=none; b=tomvMuDDldWdK8TJTazqiQXuCjp8iXPJQcJjGsidMzc6xtxPL7Xgcp3I8CjNnIULCrP9u7rAJOJgOIFQ7TIp0ddghAjnq5qH8EhDhLAsgZojjbwlx4DOHrxxgr6PPz0mjyZ1eddzngDTtT5FdRD3vDulQiaKdmB1bnwV7aqimtw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786436870; c=relaxed/simple;
	bh=IzRlEU23yfQQ6x4BYmQXGZqejxD9TteX1wiEO5R8YME=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sSNvJe3O2APR6wMwvOo3J7CxbFp7Wix+gWs9HZ0ykjDfMkUnhue5sRXR2rbbXi9IEMs6FSrRlQH+OHfSbP7uoj6LM/szLlsFLRI+wm1dZvrSGPi0cJYDpqh4zyBw/q8XWbgNxniO/KcD7aII0mALqcd6/SFerojsQkHM9oXguSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hDXqlu37; arc=none smtp.client-ip=209.85.167.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hDXqlu37"
Received: by mail-oi1-f174.google.com with SMTP id 5614622812f47-499f6e0bbabso1596288b6e.0
        for <mfd@lists.linux.dev>; Tue, 11 Aug 2026 01:27:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786436867; x=1787041667; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gyzPxN0hN+8W2JU9IAdx12pcVnDBJDk0tQrb35djIKE=;
        b=hDXqlu37bBAgE2DWnEQlSDODe5XXrzy3c/G1+1vRwYz4blC+vY/Uo/bCqg2wStRVoU
         U68XQNR+X8MQNPgQQIODgkmOBcTGEqYVl5+9kMRb464tKuS93/DK0dzzXwfyv+793GeH
         t2ybBb4qfdhUx1uTp7K4cXf1mffYdrVOwCAEZdtstIDPWp/KtjmUNSv0C/EZwf6xAgAw
         0HSJ84iYGdGp8l2Wm7+FHwUxScTm8Q7/Gth8kCTzimuQ2LsF/ka6yqbPtAkFqrmEyNJZ
         vO9sWLGQZD9JMVz9W0OyzRz8XTBKfugWrLkJpSZGG9FOZulYEqkKi3g/roY3O/MU+/go
         zrIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786436867; x=1787041667;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gyzPxN0hN+8W2JU9IAdx12pcVnDBJDk0tQrb35djIKE=;
        b=dfiKy7/noK15f2/tBxMaKj6TYUEwwxylYN0IFqMmiHUbnhUaHp5PQvJ+jIcxKudbPQ
         uazphShGt6Ds2leM2vglLTvEJkfyeGcHTTz+5JK7wRsIhgBC3f2kYMVLlvue07Tv/pMA
         6E71t6F0T/Zi91sWI7aspNIaHsS0aM8qzmTxxgBMQX/Kl4O2lEjk6LNnYP7sHTOelnDP
         I2sZyvXduVo6bHR3QTUshVP1SWwUFQJEF2/+jhYhht9pAmGmvBenJkAV0YWRX9zGzAor
         YkNxaoLNM92/ns06R0j5qmm2R+SBmks63SUrNlBlpc10+CIt94x00K52r7a1BaCyAQXZ
         4k8w==
X-Gm-Message-State: AOJu0YwJDR0qnfm/bjgD1iDGc94k3adaMCkMEj4du74VGVl6y037UW5A
	1Nxz8ijs52U21TF631AWBhOFLB/Lhvx1Eg903+1qCEdMMLF9QuCC51jO
X-Gm-Gg: AR+sD133XISenjPNxknRPP3EgXieNRWtkexYqZBDIMYzSzc5dDAxHWSsunEtUePvC96
	w98JoibC+N+0cg9HBxv48EYPsgTyUWqhWFbC2R3VWC7bO1sWaIyhJyZxB2/UoEVu7RlJEj5t9Ll
	ilEfxU3/ntaTvY17xZjUHhCMNcuVzVET8JpuZ7odYPEALieoO3a3Dgr5NIVXURvZVF7X13zWAJv
	974+X/sVLEhurse42P/lOnXXH9QJ8CaPC0EEOe0LR8pnE7fXDQFNYaFoUnEklRYWN7P3WiCuxGw
	/CympABU/1Nc9KH7W7weOeCkLdXMDCVY2wM/0Rj/qChsq37aU7L/fshzF3InVDJdZHWDIbpgaLn
	eao9jFSlpiLz2A4FubbqaWobX80oh2sDSn5Oy+Oc8Z7H0+WjeXA/Z5/Qh8/68+V9U6HwrQbFKDE
	7MdfcNenXf4zMrAcKcwfnJ87gRpJQhe0na84S1IW/p4aiyj7PlfbkZDCWivnRvDm+WMh0NQy+C4
	h8XyWUQTyFzvgrbxZn+fSiwl0jGkKldgseLVWiLjzLnrQt+Armado4yV2s0mOiheZKd7SWWoPg6
	AwioPrETm3ZIOkO0pAzxYrVt3g9ClBoq0SVhFzF6LXo4hLb3ppwEZ/BN0/DMojuUh5QjCp07K72
	uHv7qBGN1hZA5X4XQ
X-Received: by 2002:a05:6808:bc6:b0:495:da3c:1aa with SMTP id 5614622812f47-4b1fd9af94amr998551b6e.16.1786436866871;
        Tue, 11 Aug 2026 01:27:46 -0700 (PDT)
Received: from [127.0.1.1] (184-96-154-59.hlrn.qwest.net. [184.96.154.59])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4b1fff55fdcsm318095b6e.6.2026.08.11.01.27.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2026 01:27:45 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 11 Aug 2026 02:27:24 -0600
Subject: [PATCH v6 2/3] mfd: syscon: Add managed registration for external
 regmaps
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260811-submit-ac200-mfd-v6-2-c5b1292c8498@gmail.com>
References: <20260811-submit-ac200-mfd-v6-0-c5b1292c8498@gmail.com>
In-Reply-To: <20260811-submit-ac200-mfd-v6-0-c5b1292c8498@gmail.com>
To: Lee Jones <lee@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 James Hilliard <james.hilliard1@gmail.com>
Cc: mfd@lists.linux.dev, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2

of_syscon_register_regmap() publishes an externally owned regmap in the
global syscon list, but provides no way for a removable driver to
withdraw it. Registering a devm-managed regmap from such a driver would
therefore leave a stale pointer after unbind.

Factor external registration through an internal helper and add
devm_of_syscon_register_regmap(). The managed action removes the entry
under the syscon list lock before later devres actions release the
regmap. Hold a device-node reference for the lifetime of every
externally registered entry so its lookup key also remains valid.

Consumers of a removable provider remain responsible for ordering
teardown, for example with a managed device link.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mfd/syscon.c       | 87 ++++++++++++++++++++++++++++++++++------------
 include/linux/mfd/syscon.h | 12 +++++++
 2 files changed, 77 insertions(+), 22 deletions(-)

diff --git a/drivers/mfd/syscon.c b/drivers/mfd/syscon.c
index 21a7fcdd2737..448422fe4f21 100644
--- a/drivers/mfd/syscon.c
+++ b/drivers/mfd/syscon.c
@@ -10,6 +10,7 @@
 
 #include <linux/cleanup.h>
 #include <linux/clk.h>
+#include <linux/device.h>
 #include <linux/err.h>
 #include <linux/hwspinlock.h>
 #include <linux/list.h>
@@ -193,53 +194,95 @@ static struct regmap *device_node_get_regmap(struct device_node *np,
 	return syscon->regmap;
 }
 
-/**
- * of_syscon_register_regmap() - Register regmap for specified device node
- * @np: Device tree node
- * @regmap: Pointer to regmap object
- *
- * Register an externally created regmap object with syscon for the specified
- * device tree node. This regmap will then be returned to client drivers using
- * the syscon_regmap_lookup_by_phandle() API.
- *
- * Return: 0 on success, negative error code on failure.
- */
-int of_syscon_register_regmap(struct device_node *np, struct regmap *regmap)
+static struct syscon *
+of_syscon_register_regmap_internal(struct device_node *np,
+				   struct regmap *regmap)
 {
 	struct syscon *entry, *syscon = NULL;
-	int ret;
 
 	if (!np || !regmap)
-		return -EINVAL;
+		return ERR_PTR(-EINVAL);
 
 	syscon = kzalloc_obj(*syscon);
 	if (!syscon)
-		return -ENOMEM;
+		return ERR_PTR(-ENOMEM);
 
 	/* check if syscon entry already exists */
 	mutex_lock(&syscon_list_lock);
 
 	list_for_each_entry(entry, &syscon_list, list)
 		if (entry->np == np) {
-			ret = -EEXIST;
-			goto err_unlock;
+			mutex_unlock(&syscon_list_lock);
+			kfree(syscon);
+			return ERR_PTR(-EEXIST);
 		}
 
 	syscon->regmap = regmap;
-	syscon->np = np;
+	syscon->np = of_node_get(np);
 
 	/* register the regmap in syscon list */
 	list_add_tail(&syscon->list, &syscon_list);
 	mutex_unlock(&syscon_list_lock);
 
-	return 0;
+	return syscon;
+}
+
+/**
+ * of_syscon_register_regmap() - Register regmap for specified device node
+ * @np: Device tree node
+ * @regmap: Pointer to regmap object
+ *
+ * Register an externally created regmap object with syscon for the specified
+ * device tree node. This regmap will then be returned to client drivers using
+ * the syscon_regmap_lookup_by_phandle() API.
+ *
+ * Return: 0 on success, negative error code on failure.
+ */
+int of_syscon_register_regmap(struct device_node *np, struct regmap *regmap)
+{
+	return PTR_ERR_OR_ZERO(of_syscon_register_regmap_internal(np, regmap));
+}
+EXPORT_SYMBOL_GPL(of_syscon_register_regmap);
+
+static void devm_of_syscon_register_regmap_release(void *data)
+{
+	struct syscon *syscon = data;
 
-err_unlock:
+	mutex_lock(&syscon_list_lock);
+	list_del(&syscon->list);
 	mutex_unlock(&syscon_list_lock);
+
+	of_node_put(syscon->np);
 	kfree(syscon);
-	return ret;
 }
-EXPORT_SYMBOL_GPL(of_syscon_register_regmap);
+
+/**
+ * devm_of_syscon_register_regmap() - Register a managed external syscon regmap
+ * @dev: Device that owns the regmap
+ * @np: Device tree node associated with the regmap
+ * @regmap: Pointer to the externally created regmap
+ *
+ * Register an externally created regmap object with syscon and remove it when
+ * @dev is unbound. Consumers must stop using the regmap before the provider is
+ * unbound, for example by establishing a managed device link to @dev.
+ *
+ * Return: 0 on success, negative error code on failure.
+ */
+int devm_of_syscon_register_regmap(struct device *dev,
+				   struct device_node *np,
+				   struct regmap *regmap)
+{
+	struct syscon *syscon;
+
+	syscon = of_syscon_register_regmap_internal(np, regmap);
+	if (IS_ERR(syscon))
+		return PTR_ERR(syscon);
+
+	return devm_add_action_or_reset(dev,
+					devm_of_syscon_register_regmap_release,
+					syscon);
+}
+EXPORT_SYMBOL_GPL(devm_of_syscon_register_regmap);
 
 /**
  * device_node_to_regmap() - Get or create a regmap for specified device node
diff --git a/include/linux/mfd/syscon.h b/include/linux/mfd/syscon.h
index aad9c6b50463..3e804fc1b03e 100644
--- a/include/linux/mfd/syscon.h
+++ b/include/linux/mfd/syscon.h
@@ -15,6 +15,7 @@
 #include <linux/errno.h>
 
 struct device_node;
+struct device;
 
 #ifdef CONFIG_MFD_SYSCON
 struct regmap *device_node_to_regmap(struct device_node *np);
@@ -30,6 +31,9 @@ struct regmap *syscon_regmap_lookup_by_phandle_optional(struct device_node *np,
 							const char *property);
 int of_syscon_register_regmap(struct device_node *np,
 			      struct regmap *regmap);
+int devm_of_syscon_register_regmap(struct device *dev,
+				   struct device_node *np,
+				   struct regmap *regmap);
 #else
 static inline struct regmap *device_node_to_regmap(struct device_node *np)
 {
@@ -75,6 +79,14 @@ static inline int of_syscon_register_regmap(struct device_node *np,
 	return -EOPNOTSUPP;
 }
 
+static inline int
+devm_of_syscon_register_regmap(struct device *dev,
+			       struct device_node *np,
+			       struct regmap *regmap)
+{
+	return -EOPNOTSUPP;
+}
+
 #endif
 
 #endif /* __LINUX_MFD_SYSCON_H__ */

-- 
2.53.0

